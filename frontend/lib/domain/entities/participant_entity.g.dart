// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipantEntityImpl _$$ParticipantEntityImplFromJson(
  Map<String, dynamic> json,
) => _$ParticipantEntityImpl(
  id: json['id'] as String,
  user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
  event: EventEntity.fromJson(json['event'] as Map<String, dynamic>),
  status: $enumDecode(_$ParticipantStatusEnumMap, json['status']),
);

Map<String, dynamic> _$$ParticipantEntityImplToJson(
  _$ParticipantEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'event': instance.event,
  'status': _$ParticipantStatusEnumMap[instance.status]!,
};

const _$ParticipantStatusEnumMap = {
  ParticipantStatus.REGISTERED: 'REGISTERED',
  ParticipantStatus.PAID_DEPOSIT: 'PAID_DEPOSIT',
  ParticipantStatus.PAID_FULL: 'PAID_FULL',
  ParticipantStatus.CANCELLED: 'CANCELLED',
};
