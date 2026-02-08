import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

part 'auth_repository_impl.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(ref.watch(authRemoteDataSourceProvider));
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;
  static const String _tokenKey = 'auth_token';

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<UserEntity> login(String email, String password) async {
    final dto = await _dataSource.login(email, password);
    if (dto.token != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, dto.token!);
    }
    return dto.toDomain();
  }

  @override
  Future<UserEntity> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String gender,
    required DateTime birthDate,
  }) async {
    final data = {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'birth_date': birthDate.toIso8601String(),
    };
    final dto = await _dataSource.register(data);
    if (dto.token != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, dto.token!);
    }
    return dto.toDomain();
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(_tokenKey);
      if (token == null) return null;

      final dto = await _dataSource.getCurrentUser();
      return dto.toDomain();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
