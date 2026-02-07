// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticipantDto _$ParticipantDtoFromJson(Map<String, dynamic> json) =>
    ParticipantDto(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      eventId: json['event_id'] as String?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      event: json['event'] == null
          ? null
          : EventDto.fromJson(json['event'] as Map<String, dynamic>),
      status: json['status'] as String,
    );
