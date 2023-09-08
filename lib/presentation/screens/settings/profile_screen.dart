import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/infraestructure/auth/auth_service.dart';
import 'package:tesis_app/presentation/blocs/profile_cubit/profile_cubit.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = 'profile_screen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF008FD5),
        appBar: AppBar(
          backgroundColor: const Color(0xFF008FD5),
          title: const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Perfil',
                style: TextStyle(
                    fontSize: 40, color: Color.fromARGB(255, 255, 255, 255)),
              )),
          leading: IconButton(
              color: Colors.white,
              onPressed: () {
                context.go('/home');
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: BlocProvider(
          create: (context) => ProfileCubit(),
          child: ListView(
            children: [
              FadeInDownBig(
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  shadowColor: const Color.fromARGB(255, 0, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Column(
                      children: [
                        SizedBox(
                          width: 380,
                          height: 200,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                                  AssetImage('assets/images/perfil.webp'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'Buen dia, Feliciana',
                            style: TextStyle(
                                fontSize: 22.0,
                                color: Color(0xff003976),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 0),
                child: FadeInLeft(
                  child: const Card(
                    color: Colors.transparent,
                    shadowColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                              60)), // Controla el radio de las esquinas biseladas
                    ),
                    elevation: 4,
                    child: _FormProfile(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton.icon(
                  onPressed: () {
                    final router = GoRouter.of(context);
                    cerrarSesion();
                    router.go('/'); // Asegúrate de que '/login'
                  },
                  icon: const Icon(Icons.logout), // Ícono del botón
                  label: const Text('Cerrar Sesión'), // Etiqueta del botón
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}

void cerrarSesion() {
  AuthService authService = AuthService();
  authService.clearUserCredentials();
}

class _FormProfile extends StatelessWidget {
  const _FormProfile();

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.watch<ProfileCubit>();
    final nombreProfile = profileCubit.state.nombreProfile;
    final apellidoProfile = profileCubit.state.apellidosProfile;
    final dniProfile = profileCubit.state.dniProfile;
    final edadProfile = profileCubit.state.edadProfile;
    final generoProfile = profileCubit.state.generoProfile;

    return Form(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: [
          // Agrega los campos del formulario aquí
          InputTextFormField(
            label: 'Nombre',
            onChanged: profileCubit.nombreProfileChange,
            erroMessage: nombreProfile.errorMessage,
          ),
          const SizedBox(
            height: 10,
          ),
          InputTextFormField(
            label: 'Apellidos',
            onChanged: profileCubit.apellidoProfilechange,
            erroMessage: apellidoProfile.errorMessage,
          ),
          const SizedBox(
            height: 10,
          ),

          InputTextFormField(
            label: 'Edad',
            onChanged: profileCubit.edadProfileChange,
            erroMessage: edadProfile.errorMessage,
          ),
          const SizedBox(
            height: 10,
          ),

          InputTextFormField(
            label: 'Genero',
            onChanged: profileCubit.generoProfileChange,
            erroMessage: generoProfile.errorMessage,
          ),
          const SizedBox(
            height: 10,
          ),

          InputTextFormField(
            label: 'Dni',
            onChanged: profileCubit.dniProfileChange,
            erroMessage: dniProfile.errorMessage,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              // Acción al presionar el botón
              //profileCubit.onSubmit();
              profileCubit.guardarPersona();
            },
            child: const Text(
              'Guardar Datos',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
