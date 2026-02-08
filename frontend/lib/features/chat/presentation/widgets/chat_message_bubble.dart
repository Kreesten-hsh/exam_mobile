import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/chat_message_entity.dart';
import 'package:audioplayers/audioplayers.dart';

class ChatMessageBubble extends StatefulWidget {
  final ChatMessageEntity message;

  const ChatMessageBubble({super.key, required this.message});

  @override
  State<ChatMessageBubble> createState() => _ChatMessageBubbleState();
}

class _ChatMessageBubbleState extends State<ChatMessageBubble> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    if (widget.message.type == MessageType.audio) {
      _initAudioPlayer();
    }
  }

  void _initAudioPlayer() {
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == PlayerState.playing;
        });
      }
    });

    _audioPlayer.onDurationChanged.listen((d) {
      if (mounted) {
        setState(() => _duration = d);
      }
    });

    _audioPlayer.onPositionChanged.listen((p) {
      if (mounted) {
        setState(() => _position = p);
      }
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          _position = Duration.zero;
          _isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _toggleAudio() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      Source source;
      if (widget.message.content.startsWith('http')) {
        source = UrlSource(widget.message.content);
      } else {
        source = DeviceFileSource(widget.message.content);
      }
      await _audioPlayer.play(source);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMine = widget.message.isMine;
    final align = isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final color = isMine ? AppTheme.accentTeal : AppTheme.accentViolet;
    final borderRadius = BorderRadius.only(
      topLeft: const Radius.circular(16),
      topRight: const Radius.circular(16),
      bottomLeft: isMine ? const Radius.circular(16) : Radius.zero,
      bottomRight: isMine ? Radius.zero : const Radius.circular(16),
    );

    final isTemp = widget.message.id.startsWith('temp-');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Row(
            mainAxisAlignment:
                isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!isMine) ...[
                _buildAvatar(),
                const SizedBox(width: 8),
              ],
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withValues(
                        alpha:
                            0.2), // Keeping existing color logic but maybe refining later
                    borderRadius: borderRadius,
                    border: Border.all(color: color.withValues(alpha: 0.5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.message.type == MessageType.text
                          ? Text(
                              widget.message.content,
                              style: const TextStyle(color: Colors.white),
                            )
                          : _buildAudioPlayer(color),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 40, right: 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment:
                  isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                if (isMine) ...[
                  if (isTemp)
                    const Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Icon(Icons.access_time,
                          size: 10, color: AppTheme.textGrey),
                    )
                  else
                    const Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Icon(Icons.done_all,
                          size: 12,
                          color: AppTheme
                              .accentTeal), // Simulate read receipt or just sent
                    ),
                ],
                Text(
                  _formatTime(widget.message.createdAt),
                  style:
                      const TextStyle(fontSize: 10, color: AppTheme.textGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    // Determine icon based on gender
    final isMale = widget.message.senderGender == 'M' ||
        widget.message.senderGender == 'male';
    final color = isMale ? AppTheme.accentTeal : AppTheme.accentViolet;

    return CircleAvatar(
      radius: 16,
      backgroundColor: color.withValues(alpha: 0.2),
      child: Icon(
        isMale ? Icons.male : Icons.female,
        size: 16,
        color: color,
      ),
    );
  }

  Widget _buildAudioPlayer(Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow, color: color),
          onPressed: _toggleAudio,
        ),
        Slider(
          value: _position.inSeconds.toDouble(),
          min: 0.0,
          max: _duration.inSeconds.toDouble() > 0
              ? _duration.inSeconds.toDouble()
              : 1.0,
          activeColor: color,
          inactiveColor: AppTheme.textGrey,
          onChanged: (value) async {
            final position = Duration(seconds: value.toInt());
            await _audioPlayer.seek(position);
          },
        ),
        Text(
          _formatDuration(_duration),
          style: const TextStyle(fontSize: 10, color: AppTheme.textGrey),
        ),
      ],
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
