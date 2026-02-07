import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/register_use_case.dart';

part 'usecase_providers.g.dart';

@riverpod
LoginUseCase loginUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
}

@riverpod
RegisterUseCase registerUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return RegisterUseCase(repository);
}
