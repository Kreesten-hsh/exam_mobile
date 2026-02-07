import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../presentation/riverpod/auth_provider.dart';
import '../../presentation/screens/login_screen.dart';
import '../../presentation/screens/register_screen.dart';
import '../../presentation/screens/home_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isAuthenticated = authState.valueOrNull != null;
      final isLoggingIn = state.uri.toString() == '/login';
      final isRegistering = state.uri.toString() == '/register';

      if (authState.isLoading) return null;

      if (!isAuthenticated) {
        if (isLoggingIn || isRegistering) return null;
        return '/login';
      }

      if (isAuthenticated && (isLoggingIn || isRegistering)) {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
}
