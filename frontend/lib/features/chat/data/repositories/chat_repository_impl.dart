import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../features/auth/presentation/providers/auth_provider.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';
import '../models/chat_message_dto.dart';

part 'chat_repository_impl.g.dart';

@riverpod
ChatRepository chatRepository(ChatRepositoryRef ref) {
  return ChatRepositoryImpl(
    dataSource: ref.watch(chatRemoteDataSourceProvider),
    ref: ref,
  );
}

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource dataSource;
  final ChatRepositoryRef ref;

  ChatRepositoryImpl({required this.dataSource, required this.ref});

  @override
  void connect(String eventId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token != null) {
      dataSource.connect(eventId, token);
    } else {
      print('Chat Error: No auth token found');
    }
  }

  @override
  void disconnect() {
    dataSource.disconnect();
  }

  @override
  Future<List<ChatMessageEntity>> getHistory(
      String eventId, String otherId) async {
    // Need current user ID to determine isMine
    final user = ref.read(authProvider).valueOrNull;
    if (user == null) return [];

    final dtos = await dataSource.getHistory(eventId, otherId);
    return dtos.map((dto) => dto.toDomain(user.id)).toList();
  }

  @override
  Stream<List<ChatMessageEntity>> getMessagesStream(String eventId) {
    final user = ref.read(authProvider).valueOrNull;
    if (user == null) return const Stream.empty();

    return dataSource.messageStream.map((dto) {
      return [dto.toDomain(user.id)];
    });
  }

  @override
  Future<ChatMessageEntity> sendAudio(
      String eventId, String otherId, String filePath) async {
    final dto = await dataSource.sendAudio(eventId, otherId, filePath);
    final user = ref.read(authProvider).valueOrNull;
    if (user == null) throw Exception('User not authenticated');
    return dto.toDomain(user.id);
  }

  @override
  Future<ChatMessageEntity> sendMessage(
      String eventId, String otherId, String content, MessageType type) async {
    final dto = await dataSource.sendMessage(eventId, otherId, content,
        type == MessageType.audio ? 'audio' : 'text');
    final user = ref.read(authProvider).valueOrNull;
    if (user == null) throw Exception('User not authenticated');
    return dto.toDomain(user.id);
  }
}
