import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/api_constants.dart';
import 'auth_interceptor.dart';
import 'shared_preferences_provider.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  // Watch sharedPreferencesProvider to get the instance
  final prefsAsync = ref.watch(sharedPreferencesProvider);

  // Create Dio instance
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // We need to wait for prefs to be available.
  // Since dio provider is synchronous in this signature, and sharedPreferences is async provider,
  // we rely on the fact that we override sharedPreferencesProvider in main.dart with a completed Future/Value.
  // However, ref.watch will return AsyncValue.

  // If we change dio to Future<Dio>, we can await.
  // But let's check sharedPreferencesProvider definition. It returns Future<SharedPreferences>.
  // So ref.watch gives AsyncValue<SharedPreferences>.

  prefsAsync.whenData((prefs) {
    dio.interceptors.add(AuthInterceptor(prefs));
  });

  // Add LogInterceptor
  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ),
  );

  return dio;
}
