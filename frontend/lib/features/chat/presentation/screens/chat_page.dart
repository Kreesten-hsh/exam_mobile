import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/chat_provider.dart';
import '../widgets/chat_input_field.dart';
import '../widgets/chat_message_bubble.dart';

class ChatPage extends ConsumerStatefulWidget {
  final String eventId;
  final String otherId;
  final String eventName;

  const ChatPage(
      {super.key,
      required this.eventId,
      required this.otherId,
      required this.eventName});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider(widget.eventId, widget.otherId));

    ref.listen(chatProvider(widget.eventId, widget.otherId), (previous, next) {
      if (next is AsyncData && next.value != null && next.value!.isNotEmpty) {
        Future.delayed(const Duration(milliseconds: 100), () {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.midnightBlueDark,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.eventName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Discussion sécurisée 🔒',
              style: TextStyle(
                color: AppTheme.accentTeal,
                fontSize: 12,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: chatState.when(
              data: (messages) {
                if (messages.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chat_bubble_outline,
                            size: 48,
                            color: AppTheme.textGrey.withValues(alpha: 0.5)),
                        const SizedBox(height: 16),
                        const Text(
                          'Aucun message pour le moment.\nSoyez le premier à dire bonjour ! 👋',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppTheme.textGrey),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(bottom: 16, top: 16),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return ChatMessageBubble(message: message);
                  },
                );
              },
              error: (err, stack) => Center(
                child: Text('Erreur inaccessible: $err', // User friendly error?
                    style: const TextStyle(color: Colors.red)),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(color: AppTheme.accentTeal),
              ),
            ),
          ),
          ChatInputField(eventId: widget.eventId, otherId: widget.otherId),
        ],
      ),
    );
  }
}
