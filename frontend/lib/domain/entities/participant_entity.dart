import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_entity.dart';
import 'event_entity.dart';
import 'enums.dart';

part 'participant_entity.freezed.dart';
part 'participant_entity.g.dart';

@freezed
class ParticipantEntity with _$ParticipantEntity {
  const factory ParticipantEntity({
    required String id,
    required UserEntity user,
    required EventEntity event,
    required ParticipantStatus status,
  }) = _ParticipantEntity;

  factory ParticipantEntity.fromJson(Map<String, dynamic> json) =>
      _$ParticipantEntityFromJson(json);
}
