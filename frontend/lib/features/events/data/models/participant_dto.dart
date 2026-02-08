import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/participant_entity.dart';

part 'participant_dto.freezed.dart';
part 'participant_dto.g.dart';

@freezed
class ParticipantDto with _$ParticipantDto {
  const ParticipantDto._();

  const factory ParticipantDto({
    required String id,
    @JsonKey(name: 'first_name') required String firstName,
    required String gender,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _ParticipantDto;

  factory ParticipantDto.fromJson(Map<String, dynamic> json) =>
      _$ParticipantDtoFromJson(json);

  ParticipantEntity toDomain() {
    return ParticipantEntity(
      id: id,
      firstName: firstName,
      gender: gender,
      avatarUrl: avatarUrl,
    );
  }
}
