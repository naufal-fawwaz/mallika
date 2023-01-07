import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:malika/presenter/pages/login_page.dart';
import 'package:malika/presenter/pages/main_page.dart';
import 'package:malika/presenter/pages/onboarding_page.dart';

final router = GoRouter(
  initialLocation: FirebaseAuth.instance.currentUser != null ? '/main' : '/',
  routes: [
    GoRoute(
      path: '/',
      builder: ((context, state) {
        return const LoginPage();
      }),
    ),
    GoRoute(
      path: '/onboarding',
      builder: ((context, state) => const OnboardingPage()),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainPage(),
    ),
  ],
);
