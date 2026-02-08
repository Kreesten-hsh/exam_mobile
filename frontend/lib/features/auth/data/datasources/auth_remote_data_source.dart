import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/dio_provider.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/user_dto.dart';

part 'auth_remote_data_source.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSource(ref.watch(dioProvider));
}

class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  Future<UserDto> login(String email, String password) async {
    try {
      final response = await _dio.post(
        ApiConstants.login,
        data: {'email': email, 'password': password},
      );

      final rawData = response.data;
      final userMap = rawData['user'] as Map<String, dynamic>;
      final token = rawData['token'] as String?;

      // Flatten the response for UserDto
      final flatMap = Map<String, dynamic>.from(userMap);
      if (token != null) {
        flatMap['token'] = token;
      }

      return UserDto.fromJson(flatMap);
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Login failed');
    }
  }

  Future<UserDto> register(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(
        ApiConstants.register,
        data: data,
      );

      // DEBUG LOG REMOVED
      final rawData = response.data;
      final userMap = rawData['user'] as Map<String, dynamic>;
      final token = rawData['token'] as String?;

      // Flatten the response for UserDto
      final flatMap = Map<String, dynamic>.from(userMap);
      if (token != null) {
        flatMap['token'] = token;
      }

      return UserDto.fromJson(flatMap);
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Registration failed');
    }
  }

  Future<UserDto> getCurrentUser() async {
    try {
      final response = await _dio.get(ApiConstants.me);
      return UserDto.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Failed to get current user');
    }
  }
}
