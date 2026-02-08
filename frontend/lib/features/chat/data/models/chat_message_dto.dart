import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/chat_message_entity.dart';

part 'chat_message_dto.freezed.dart';
part 'chat_message_dto.g.dart';

@freezed
class ChatMessageDto with _$ChatMessageDto {
  const factory ChatMessageDto({
    required String id,
    @JsonKey(name: 'sender_id') required String senderId,
    @JsonKey(name: 'sender_name') required String senderName,
    @JsonKey(name: 'sender_gender') required String senderGender,
    @JsonKey(name: 'sender_avatar') @Default('') String senderAvatar,
    @JsonKey(name: 'content') required String content,
    @JsonKey(name: 'type') @Default('text') String type,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _ChatMessageDto;

  factory ChatMessageDto.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageDtoFromJson(json);
}

extension ChatMessageDtoX on ChatMessageDto {
  ChatMessageEntity toDomain(String currentUserId) {
    return ChatMessageEntity(
      id: id,
      senderId: senderId,
      senderName: senderName,
      senderGender: senderGender,
      senderAvatar: senderAvatar,
      isMine: senderId == currentUserId,
      content: content,
      type: type == 'audio' ? MessageType.audio : MessageType.text,
      createdAt: createdAt,
    );
  }
}
