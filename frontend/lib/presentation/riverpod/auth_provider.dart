import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/user_entity.dart';
import '../../data/repositories/auth_repository_impl.dart';
import 'usecase_providers.dart';
import '../../core/config/shared_preferences_provider.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  Future<UserEntity?> build() async {
    return _checkCurrentUser();
  }

  Future<UserEntity?> _checkCurrentUser() async {
    try {
      final prefs = await ref.watch(sharedPreferencesProvider.future);
      if (!prefs.containsKey('auth_token')) return null;

      final repo = ref.read(authRepositoryProvider);
      return await repo.getCurrentUser();
    } catch (e) {
      return null;
    }
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(loginUseCaseProvider);
      return await useCase(email, password);
    });
  }

  Future<void> register(
    String email,
    String password,
    String firstName,
    String lastName,
    String gender,
    DateTime birthDate, {
    String? photoUrl,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(registerUseCaseProvider);
      return await useCase(
        email,
        password,
        firstName,
        lastName,
        gender,
        birthDate,
        photoUrl: photoUrl,
      );
    });
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.logout();
    state = const AsyncValue.data(null);
  }
}
