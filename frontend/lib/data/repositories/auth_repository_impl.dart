import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_repository_impl.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(ref.watch(authRemoteDataSourceProvider));
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<UserEntity> login(String email, String password) async {
    final dto = await _dataSource.login(email, password);
    if (dto.token != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', dto.token!);
    }
    return dto.toDomain();
  }

  @override
  Future<UserEntity> register(
    String email,
    String password,
    String firstName,
    String lastName,
    String gender,
    DateTime birthDate, {
    String? profilePhotoUrl,
  }) async {
    final dto = await _dataSource.register(
      email,
      password,
      firstName,
      lastName,
      gender,
      birthDate,
      profilePhotoUrl: profilePhotoUrl,
    );
    if (dto.token != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', dto.token!);
    }
    return dto.toDomain();
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      final dto = await _dataSource.getCurrentUser();
      return dto.toDomain();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }
}
