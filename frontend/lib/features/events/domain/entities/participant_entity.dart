import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant_entity.freezed.dart';
part 'participant_entity.g.dart';

@freezed
class ParticipantEntity with _$ParticipantEntity {
  const factory ParticipantEntity({
    required String id,
    required String firstName,
    required String gender,
    String? avatarUrl,
  }) = _ParticipantEntity;

  factory ParticipantEntity.fromJson(Map<String, dynamic> json) =>
      _$ParticipantEntityFromJson(json);
}
