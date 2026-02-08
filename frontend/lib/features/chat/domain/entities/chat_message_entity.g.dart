// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageEntityImpl _$$ChatMessageEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatMessageEntityImpl(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      senderName: json['senderName'] as String,
      senderGender: json['senderGender'] as String,
      senderAvatar: json['senderAvatar'] as String? ?? '',
      isMine: json['isMine'] as bool,
      content: json['content'] as String,
      type: $enumDecodeNullable(_$MessageTypeEnumMap, json['type']) ??
          MessageType.text,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ChatMessageEntityImplToJson(
        _$ChatMessageEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderGender': instance.senderGender,
      'senderAvatar': instance.senderAvatar,
      'isMine': instance.isMine,
      'content': instance.content,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.audio: 'audio',
};
