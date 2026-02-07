import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> register(
    String email,
    String password,
    String firstName,
    String lastName,
    String gender,
    DateTime birthDate, {
    String? profilePhotoUrl,
  });
  Future<UserEntity?> getCurrentUser();
  Future<void> logout();
}
