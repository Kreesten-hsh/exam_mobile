import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_entity.freezed.dart';
part 'chat_message_entity.g.dart';

enum MessageType { text, audio }

@freezed
class ChatMessageEntity with _$ChatMessageEntity {
  const factory ChatMessageEntity({
    required String id,
    required String senderId,
    required String senderName,
    required String senderGender, // 'M' or 'F' (or enum)
    @Default('') String senderAvatar,
    required bool isMine,
    required String content, // Text content or Audio URL
    @Default(MessageType.text) MessageType type,
    required DateTime createdAt,
  }) = _ChatMessageEntity;

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageEntityFromJson(json);
}
