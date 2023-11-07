import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tesis_app/config/router/app_router.dart';
import 'package:tesis_app/config/theme/app_theme.dart';
import 'package:tesis_app/core/dependencies/app_dependencies.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authService = AuthService();
  final idPersonaNullable = await authService.getUserId();
  final idPersona = idPersonaNullable ?? "";

  runApp(ProviderScope(
      child: idPersona.isEmpty ? LoginApp(authService) : HomeApp(authService)));
}

class LoginApp extends StatelessWidget {
  final AuthService authService;

  const LoginApp(this.authService, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppDependencies.blocProviders, // Agrega tus BlocProviders
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
      ),
    );
  }
}

class HomeApp extends StatelessWidget {
  final AuthService authService;

  const HomeApp(this.authService, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppDependencies.blocProviders, // Agrega tus BlocProviders
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: AppDependencies.blocProviders,
//       child: MaterialApp.router(
//         routerConfig: appRouter,
//         debugShowCheckedModeBanner: false,
//         theme: AppTheme().getTheme(),
//       ),
//     );
//   }
// }
