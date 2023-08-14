import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/login',
    name: LoginScreen.name,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/signup',
    name: SignUpScreen.name,
    builder: (context, state) => const SignUpScreen(),
  ),
  GoRoute(
    path: '/assistant',
    name: AssistantScreen.name,
    builder: (context, state) => const AssistantScreen(),
  ),
    GoRoute(
    path: '/entertainment',
    name: EntertainmentScreen.name,
    builder: (context, state) => const EntertainmentScreen(),
  ),
  GoRoute(
    path: '/jokes',
    name: JokesScreen.name,
    builder: (context, state) => const JokesScreen(),
  ),
  GoRoute(
    path: '/minigames',
    name: MinigamesScreen.name,
    builder: (context, state) => const MinigamesScreen(),
  ),
  GoRoute(
    path: '/music',
    name: MusicScreen.name,
    builder: (context, state) => const MusicScreen(),
  ),
  GoRoute(
    path: '/forum',
    name: ForumScreen.name,
    builder: (context, state) => const ForumScreen(),
  ),
  GoRoute(
    path: '/videos',
    name: VideosScreen.name,
    builder: (context, state) => const VideosScreen(),
  ),
  GoRoute(
    path: '/medicines',
    name: MedicinesScreen.name,
    builder: (context, state) => const MedicinesScreen(),
  ),
  GoRoute(
    path: '/message',
    name: MessageScreen.name,
    builder: (context, state) => const MessageScreen(),
  ),
  GoRoute(
    path: '/profile',
    name: ProfileScreen.name,
    builder: (context, state) => const ProfileScreen(),
  ),
  GoRoute(
    path: '/settings',
    name: SettingScreen.name,
    builder: (context, state) => const SettingScreen(),
  ),
    GoRoute(
    path: '/newMedicine',
    name: NewMedicineScreen.name,
    builder: (context, state) => const NewMedicineScreen(),
  ),
]);
