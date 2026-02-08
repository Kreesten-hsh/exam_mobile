import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/chat_message_dto.dart';
import '../../../../core/config/dio_provider.dart';

part 'chat_remote_data_source.g.dart';

@riverpod
ChatRemoteDataSource chatRemoteDataSource(ChatRemoteDataSourceRef ref) {
  return ChatRemoteDataSource(ref.watch(dioProvider));
}

class ChatRemoteDataSource {
  final Dio _dio;
  socket_io.Socket? _socket;
  final _messageController = StreamController<ChatMessageDto>.broadcast();

  ChatRemoteDataSource(this._dio);

  Stream<ChatMessageDto> get messageStream => _messageController.stream;

  void connect(String eventId, String token) {
    if (_socket != null && _socket!.connected) return;

    _socket = socket_io.io(
      ApiConstants.baseUrl.replaceAll('/api', ''), // Base URL for socket
      socket_io.OptionBuilder().setTransports(['websocket']).setExtraHeaders({
        'Authorization': 'Bearer $token'
      }).setQuery({'eventId': eventId}).build(),
    );

    _socket!.onConnect((_) {
      // Socket connected
    });

    _socket!.on('message', (data) {
      if (data != null) {
        try {
          final message = ChatMessageDto.fromJson(data);
          _messageController.add(message);
        } catch (e) {
          // Error parsing message
        }
      }
    });

    _socket!.onDisconnect((_) {});
  }

  void disconnect() {
    _socket?.disconnect();
    _socket = null;
  }

  Future<ChatMessageDto> sendMessage(
      String eventId, String otherId, String content, String type,
      {String? audioBase64}) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.events}/$eventId/messages',
        data: {
          'content': content,
          'type': type,
          'receiverId': otherId,
          if (audioBase64 != null) 'audioBase64': audioBase64,
        },
      );
      return ChatMessageDto.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Failed to send message');
    }
  }

  Future<ChatMessageDto> sendAudio(
      String eventId, String otherId, String filePath) async {
    try {
      final file = File(filePath);
      final bytes = await file.readAsBytes();
      final base64 = base64Encode(bytes);

      return await sendMessage(eventId, otherId, 'Audio message', 'audio',
          audioBase64: base64);
    } catch (e) {
      if (e is ServerException) rethrow; // Propagate server exceptions
      throw ServerException(e.toString());
    }
  }

  Future<List<ChatMessageDto>> getHistory(
      String eventId, String otherId) async {
    try {
      final response = await _dio.get(ApiConstants.messageHistory,
          queryParameters: {'otherId': otherId, 'eventId': eventId});

      return (response.data as List)
          .map((e) => ChatMessageDto.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Failed to load history');
    }
  }
}
