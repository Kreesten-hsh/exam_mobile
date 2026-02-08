// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageDtoImpl _$$ChatMessageDtoImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageDtoImpl(
      id: json['id'] as String,
      senderId: json['sender_id'] as String,
      senderName: json['sender_name'] as String,
      senderGender: json['sender_gender'] as String,
      senderAvatar: json['sender_avatar'] as String? ?? '',
      content: json['content'] as String,
      type: json['type'] as String? ?? 'text',
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ChatMessageDtoImplToJson(
        _$ChatMessageDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender_id': instance.senderId,
      'sender_name': instance.senderName,
      'sender_gender': instance.senderGender,
      'sender_avatar': instance.senderAvatar,
      'content': instance.content,
      'type': instance.type,
      'created_at': instance.createdAt.toIso8601String(),
    };
