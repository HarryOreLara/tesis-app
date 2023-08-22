import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesis_app/presentation/blocs/profile_cubit/profile_cubit.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = 'profile_screen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).colorScheme;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 176, 239, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 176, 239, 255),
          title: const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Perfil',
                style: TextStyle(fontSize: 40, color: Colors.white),
              )),
        ),
        body: BlocProvider(
          create: (context) => ProfileCubit(),
          child: ListView(
            children: const [
              Card(
                color: Color.fromARGB(255, 74, 206, 254),
                elevation: 4,
                shadowColor: Colors.amber,
                child: Column(
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
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: 16, left: 0),
                child: Card(
                  color: Color.fromARGB(255, 74, 206, 254),
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
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ));
  }
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
