import '../entities/chat_message_entity.dart';

abstract class ChatRepository {
  Stream<List<ChatMessageEntity>> getMessagesStream(String eventId);
  Future<List<ChatMessageEntity>> getHistory(String eventId, String otherId);
  Future<ChatMessageEntity> sendMessage(
      String eventId, String otherId, String content, MessageType type);
  Future<ChatMessageEntity> sendAudio(
      String eventId, String otherId, String filePath);
  void connect(String eventId);
  void disconnect();
}
