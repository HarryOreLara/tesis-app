import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/screens/home/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    )
  ]
);