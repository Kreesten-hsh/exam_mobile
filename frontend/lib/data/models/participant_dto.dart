// ignore_for_file: unused_element
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/participant_entity.dart';
import '../../domain/entities/enums.dart'; // Import enums
import 'user_dto.dart';
import 'event_dto.dart';

part 'participant_dto.g.dart';

@JsonSerializable(createToJson: false)
class ParticipantDto {
  final String id;
  @JsonKey(name: 'user_id')
  final String? userId; // It might be ID or full object depending on relations
  @JsonKey(name: 'event_id')
  final String? eventId;

  // If backend returns relation objects:
  final UserDto? user;
  final EventDto? event;

  final String status; // 'REGISTERED', etc.

  ParticipantDto({
    required this.id,
    this.userId,
    this.eventId,
    this.user,
    this.event,
    required this.status,
  });

  factory ParticipantDto.fromJson(Map<String, dynamic> json) =>
      _$ParticipantDtoFromJson(json);

  ParticipantEntity toDomain() {
    // We assume backend returns user and event when listing participants
    if (user == null || event == null) {
      // Handle missing relations if necessary, maybe fetch them or throw
      // For now, let's assume they are populated for "list participants" endpoint
      throw Exception("Participant DTO missing user or event relation");
    }

    return ParticipantEntity(
      id: id,
      user: user!.toDomain(),
      event: event!.toDomain(),
      status: ParticipantStatus.values.firstWhere(
        (e) => e.toString().split('.').last == status,
        orElse: () => ParticipantStatus.REGISTERED, // Default
      ),
    );
  }
}
