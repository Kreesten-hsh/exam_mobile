import '../repositories/auth_repository.dart';
import '../entities/user_entity.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<UserEntity> call(
    String email,
    String password,
    String firstName,
    String lastName,
    String gender,
    DateTime birthDate, {
    String? photoUrl,
  }) {
    return repository.register(
      email,
      password,
      firstName,
      lastName,
      gender,
      birthDate,
      profilePhotoUrl: photoUrl,
    );
  }
}
