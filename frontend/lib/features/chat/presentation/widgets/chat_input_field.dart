import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:record/record.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/chat_provider.dart';

class ChatInputField extends ConsumerStatefulWidget {
  final String eventId;
  final String otherId;

  const ChatInputField(
      {super.key, required this.eventId, required this.otherId});

  @override
  ConsumerState<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends ConsumerState<ChatInputField>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final AudioRecorder _audioRecorder = AudioRecorder();

  bool _isRecording = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);

    // Add listener to rebuild UI when text changes (controls Send/Mic icon)
    _textController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _audioRecorder.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Permission micro requise pour envoyer un vocal')),
        );
      }
      return;
    }

    final directory = await getTemporaryDirectory();
    final path =
        '${directory.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';

    await _audioRecorder.start(const RecordConfig(), path: path);
    setState(() {
      _isRecording = true;
    });
  }

  Future<void> _stopRecording() async {
    final path = await _audioRecorder.stop();
    setState(() {
      _isRecording = false;
    });

    if (path != null) {
      // Send audio
      try {
        await ref
            .read(chatProvider(widget.eventId, widget.otherId).notifier)
            .sendAudio(path);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erreur envoi audio: $e')),
          );
        }
      }
    }
  }

  Future<void> _sendText() async {
    final content = _textController.text.trim();
    if (content.isEmpty) return;

    try {
      await ref
          .read(chatProvider(widget.eventId, widget.otherId).notifier)
          .sendMessage(content);
      _textController.clear();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString().replaceAll('Exception: ', '')),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppTheme.midnightBlueDark,
        border: Border(top: BorderSide(color: AppTheme.midnightBlueLight)),
      ),
      child: Row(
        children: [
          if (!_isRecording)
            Expanded(
              child: TextField(
                controller: _textController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Votre message...',
                  hintStyle: const TextStyle(color: AppTheme.textGrey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AppTheme.midnightBlueLight,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                minLines: 1,
                maxLines: 4,
              ),
            ),
          const SizedBox(width: 12),
          if (_isRecording)
            Expanded(
              child: Row(
                children: [
                  FadeTransition(
                    opacity: _animationController,
                    child: const Icon(Icons.mic, color: Colors.red),
                  ),
                  const SizedBox(width: 8),
                  const Text('Enregistrement...',
                      style: TextStyle(color: Colors.red)),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.cancel, color: AppTheme.textGrey),
                    onPressed: () async {
                      await _audioRecorder.stop();
                      setState(() {
                        _isRecording = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          GestureDetector(
            onLongPress: _startRecording,
            onLongPressUp: _stopRecording,
            onTap: _isRecording ? null : _sendText,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: AppTheme.accentTeal,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _isRecording
                    ? Icons.mic
                    : (_textController.text.isNotEmpty
                        ? Icons.send
                        : Icons.mic),
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
