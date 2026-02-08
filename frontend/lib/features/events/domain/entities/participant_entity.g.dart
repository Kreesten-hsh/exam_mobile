// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipantEntityImpl _$$ParticipantEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ParticipantEntityImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      gender: json['gender'] as String,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$$ParticipantEntityImplToJson(
        _$ParticipantEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'gender': instance.gender,
      'avatarUrl': instance.avatarUrl,
    };
