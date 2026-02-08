import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/events/presentation/screens/home_screen.dart';
import '../../features/events/presentation/screens/event_detail_page.dart';
import '../../features/events/presentation/screens/event_participants_page.dart';
import '../../features/events/domain/entities/event_entity.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    // refreshListenable: authState, // Removed to avoid type mismatch
    redirect: (context, state) {
      final isAuthenticated = authState.valueOrNull != null;
      final isLogin = state.matchedLocation == '/login';
      final isRegister = state.matchedLocation == '/register';

      if (!isAuthenticated) {
        return isRegister ? null : '/login';
      }

      if (isLogin || isRegister) {
        return '/events';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(path: '/events', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/event-detail',
        builder: (context, state) {
          final event = state.extra as EventEntity;
          return EventDetailPage(event: event);
        },
      ),
      GoRoute(
        path: '/events/:id/participants',
        builder: (context, state) {
          final eventId = state.pathParameters['id']!;
          return EventParticipantsPage(eventId: eventId);
        },
      ),
    ],
  );
}
