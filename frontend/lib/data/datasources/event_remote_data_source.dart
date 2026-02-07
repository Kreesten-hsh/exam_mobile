import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/config/dio_provider.dart';
import '../../core/constants/api_constants.dart';
import '../models/event_dto.dart';
import '../../core/errors/exceptions.dart';

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

  Future<EventDto> getEvent(String id) async {
    try {
      final response = await _dio.get('${ApiConstants.events}/$id');
      return EventDto.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Failed to load event');
    }
  }

  Future<void> joinEvent(String eventId) async {
    try {
      // Assuming auth token is handled by interceptor or we pass it
      // For now, let's assume we need to add interceptor for auth token to Dio
      // The join endpoint is POST /events/:id/join
      await _dio.post(ApiConstants.joinEvent(eventId));
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Failed to join event');
    }
  }
}
