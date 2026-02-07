import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/config/dio_provider.dart';
import '../../core/constants/api_constants.dart';
import '../models/participant_dto.dart';
import '../../core/errors/exceptions.dart';

part 'participant_remote_data_source.g.dart';

@riverpod
ParticipantRemoteDataSource participantRemoteDataSource(Ref ref) {
  return ParticipantRemoteDataSource(ref.watch(dioProvider));
}

class ParticipantRemoteDataSource {
  final Dio _dio;

  ParticipantRemoteDataSource(this._dio);

  Future<List<ParticipantDto>> getParticipants(String eventId) async {
    try {
      // Backend: GET /events/:id/participants
      final response = await _dio.get(
        '${ApiConstants.events}/$eventId/participants',
      );
      final List<dynamic> data = response.data;
      return data.map((json) => ParticipantDto.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Failed to load participants');
    }
  }

  Future<void> cancelParticipation(String participantId) async {
    try {
      // Backend: DELETE /participants/:id or POST /participants/:id/cancel
      // Assuming DELETE or specific endpoint. Let's assume DELETE based on REST
      await _dio.delete('/participants/$participantId');
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Failed to cancel participation');
    }
  }
}
