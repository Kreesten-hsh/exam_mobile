import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/dio_provider.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/event_dto.dart';
import '../models/participant_dto.dart';
part 'event_remote_data_source.g.dart';

@riverpod
EventRemoteDataSource eventRemoteDataSource(Ref ref) {
  return EventRemoteDataSource(ref.watch(dioProvider));
}

class EventRemoteDataSource {
  final Dio _dio;

  EventRemoteDataSource(this._dio);

  Future<List<EventDto>> getEvents() async {
    try {
      final response = await _dio.get(ApiConstants.events);
      final List<dynamic> data = response.data;
      return data.map((json) => EventDto.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Failed to load events');
    }
  }

  Future<void> joinEvent(String eventId) async {
    try {
      await _dio.post(ApiConstants.joinEvent(eventId));
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Failed to join event');
    }
  }

  Future<List<ParticipantDto>> getParticipants(String eventId) async {
    try {
      final response = await _dio.get(ApiConstants.participants(eventId));
      final List<dynamic> data = response.data;
      return data.map((json) => ParticipantDto.fromJson(json)).toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        throw ServerException('Accès refusé : Vous devez être inscrit.');
      }
      throw ServerException(e.message ?? 'Failed to load participants');
    }
  }
}
