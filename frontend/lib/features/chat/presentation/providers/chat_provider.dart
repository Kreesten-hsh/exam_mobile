import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../../data/repositories/chat_repository_impl.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

part 'chat_provider.g.dart';

@riverpod
class Chat extends _$Chat {
  StreamSubscription<List<ChatMessageEntity>>? _subscription;
  String? _eventId;
  String? _otherId;

  @override
  FutureOr<List<ChatMessageEntity>> build(
      String eventId, String otherId) async {
    _eventId = eventId;
    _otherId = otherId;
    final repo = ref.read(chatRepositoryProvider);

    // Connect socket
    repo.connect(eventId);

    // Load initial history
    final history = await repo.getHistory(eventId, otherId);

    // Listen to real-time updates
    _subscription = repo.getMessagesStream(eventId).listen((messages) {
      if (messages.isNotEmpty) {
        final currentList = state.value ?? [];
        final uniqueMessages = messages
            .where((newMsg) =>
                !currentList.any((existing) => existing.id == newMsg.id))
            .toList();

        if (uniqueMessages.isNotEmpty) {
          state = AsyncValue.data([...currentList, ...uniqueMessages]);
        }
      }
    });

    // Cleanup on dispose
    ref.onDispose(() {
      _subscription?.cancel();
      repo.disconnect();
    });

    return history;
  }

  Future<void> sendMessage(String content) async {
    if (_eventId == null || _otherId == null) return;

    // 1. SECURITY: Anti-Phone Number Filter
    final phoneRegex = RegExp(
      r'(?:(?:\+|00)\d{1,3}|0)\s*[1-9](?:[\s.-]*\d{2}){3,}',
      caseSensitive: false,
    );
    final aggressiveNumRegex = RegExp(r'\d[\d\s\.\-]{7,}\d');

    if (phoneRegex.hasMatch(content) || aggressiveNumRegex.hasMatch(content)) {
      throw Exception(
          'L\'échange de numéros de téléphone est interdit pour votre sécurité.');
    }

    final socialRegex = RegExp(
        r'\b(whatsapp|telegram|signal|snapchat|snap|insta|instagram|fb|facebook|messenger)\b',
        caseSensitive: false);

    if (socialRegex.hasMatch(content)) {
      throw Exception(
          'L\'échange de réseaux sociaux est interdit. Utilisez le chat sécurisé.');
    }

    final user = ref.read(authProvider).valueOrNull;
    if (user == null) return;

    // Optimistic UI
    final tempId = 'temp-${DateTime.now().millisecondsSinceEpoch}';
    final optimisticMessage = ChatMessageEntity(
      id: tempId,
      senderId: user.id,
      senderName: user.firstName,
      senderGender: user.gender,
      senderAvatar: user.profilePhotoUrl ?? '',
      isMine: true,
      content: content,
      type: MessageType.text,
      createdAt: DateTime.now(),
    );

    final repo = ref.read(chatRepositoryProvider);

    // Add optimistic message
    state = AsyncValue.data([...state.value ?? [], optimisticMessage]);

    try {
      final realMessage = await repo.sendMessage(
          _eventId!, _otherId!, content, MessageType.text);

      // Replace optimistic message with real message
      final currentList = state.value ?? [];
      final updatedList = currentList.map((msg) {
        if (msg.id == tempId) return realMessage;
        return msg;
      }).toList();

      // Deduplicate (in case socket already added it)
      final uniqueMap = <String, ChatMessageEntity>{};
      for (var msg in updatedList) {
        uniqueMap[msg.id] = msg;
      }

      state = AsyncValue.data(uniqueMap.values.toList());
    } catch (e) {
      // Revert optimistic update on error
      state = AsyncValue.data(
          (state.value ?? []).where((msg) => msg.id != tempId).toList());
      rethrow;
    }
  }

  Future<void> sendAudio(String filePath) async {
    if (_eventId == null || _otherId == null) return;

    final user = ref.read(authProvider).valueOrNull;
    if (user == null) return;

    final tempId = 'temp-${DateTime.now().millisecondsSinceEpoch}';
    final optimisticMessage = ChatMessageEntity(
      id: tempId,
      senderId: user.id,
      senderName: user.firstName,
      senderGender: user.gender,
      senderAvatar: user.profilePhotoUrl ?? '',
      isMine: true,
      content: filePath, // Local path for immediate playback
      type: MessageType.audio,
      createdAt: DateTime.now(),
    );

    final repo = ref.read(chatRepositoryProvider);

    state = AsyncValue.data([...state.value ?? [], optimisticMessage]);

    try {
      final realMessage = await repo.sendAudio(_eventId!, _otherId!, filePath);

      final currentList = state.value ?? [];
      final updatedList = currentList.map((msg) {
        if (msg.id == tempId) return realMessage;
        return msg;
      }).toList();

      final uniqueMap = <String, ChatMessageEntity>{};
      for (var msg in updatedList) {
        uniqueMap[msg.id] = msg;
      }

      state = AsyncValue.data(uniqueMap.values.toList());
    } catch (e) {
      state = AsyncValue.data(
          (state.value ?? []).where((msg) => msg.id != tempId).toList());
      rethrow;
    }
  }
}
