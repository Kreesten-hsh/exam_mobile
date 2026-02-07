import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/config/dio_provider.dart';
import '../../core/constants/api_constants.dart';
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
      // Backend returns { user: ..., token: ... } or just user with token inside?
      // Based on backend audit:
      // AuthService.login returns { user, token }
      // So response.data is { user: {...}, token: "..." }

      final data = response.data;
      final userJson = data['user'] as Map<String, dynamic>;
      userJson['token'] =
          data['token']; // Inject token into user DTO for convenience

      return UserDto.fromJson(userJson);
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Login failed');
    }
  }

  Future<UserDto> register(
    String email,
    String password,
    String firstName,
    String lastName,
    String gender,
    DateTime birthDate, {
    String? profilePhotoUrl,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.register,
        data: {
          'email': email,
          'password': password,
          'first_name': firstName,
          'last_name': lastName,
          'gender': gender,
          'birth_date': birthDate.toIso8601String(),
          if (profilePhotoUrl != null) 'profile_photo_url': profilePhotoUrl,
        },
      );

      final data = response.data;
      final userJson = data['user'] as Map<String, dynamic>;
      userJson['token'] = data['token'];

      return UserDto.fromJson(userJson);
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

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}
