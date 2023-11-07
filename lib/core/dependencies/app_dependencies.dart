import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesis_app/presentation/bloc/chat/chat_bloc.dart';
import 'package:tesis_app/presentation/bloc/conversaciones/conversaciones_bloc.dart';
import 'package:tesis_app/presentation/bloc/forum/forum_bloc.dart';
import 'package:tesis_app/presentation/bloc/login/login_bloc.dart';
import 'package:tesis_app/presentation/bloc/medicines/medicine_bloc.dart';
import 'package:tesis_app/presentation/bloc/profile/profile_bloc.dart';

class AppDependencies {
  static List<BlocProvider> blocProviders = [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
    BlocProvider<MedicineBloc>(create: (context) => MedicineBloc()),
    BlocProvider<ConversacionesBloc>(create: (context) => ConversacionesBloc()),
    BlocProvider<ChatBloc>(create: (context) => ChatBloc()),
    BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
    BlocProvider<ForumBloc>(create: (context) => ForumBloc()),
  ];
}
