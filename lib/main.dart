import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tesis_app/config/router/app_router.dart';
import 'package:tesis_app/config/theme/app_theme.dart';
import 'package:tesis_app/presentation/bloc/chat/chat_bloc.dart';
import 'package:tesis_app/presentation/bloc/conversaciones/conversaciones_bloc.dart';
import 'package:tesis_app/presentation/bloc/login/login_bloc.dart';
import 'package:tesis_app/presentation/bloc/medicines/medicine_bloc.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => MedicineBloc(),
        ),
        BlocProvider(
          create: (context) => ConversacionesBloc(),
        ),
        BlocProvider(
          create: (context) => ChatBloc(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
      ),
    );
  }
}
