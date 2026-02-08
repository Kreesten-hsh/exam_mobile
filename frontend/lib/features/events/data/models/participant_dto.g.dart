// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipantDtoImpl _$$ParticipantDtoImplFromJson(Map<String, dynamic> json) =>
    _$ParticipantDtoImpl(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      gender: json['gender'] as String,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$$ParticipantDtoImplToJson(
        _$ParticipantDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'gender': instance.gender,
      'avatar_url': instance.avatarUrl,
    };
