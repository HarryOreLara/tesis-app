import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesis_app/presentation/blocs/profile_cubit/profile_cubit.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = 'profile_screen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: IconButton(
              color: Colors.white,
              onPressed: () {
                context.go('/home');
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          actions: const [Icon(Icons.dark_mode)],
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Color.fromARGB(255, 127, 15, 219)
              ], // Colores del degradado
            ),
          ),
          child: BlocProvider(
            create: (context) => ProfileCubit(),
            child: const _ProfileInterface(),
          ),
        ));
  }
}

class _ProfileInterface extends StatefulWidget {
  const _ProfileInterface();

  @override
  State<_ProfileInterface> createState() => __ProfileInterfaceState();
}

class __ProfileInterfaceState extends State<_ProfileInterface> {


  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getOnePersona();
  }

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.watch<ProfileCubit>();
    final nombreProfile = profileCubit.state.nombreProfile;
    final apellidoProfile = profileCubit.state.apellidosProfile;
    final dniProfile = profileCubit.state.dniProfile;
    final edadProfile = profileCubit.state.edadProfile;
    final generoProfile = profileCubit.state.generoProfile;

    return ListView(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Stack(
                      children: [
                        const CircleAvatar(
                          radius: 100,
                          foregroundImage:
                              AssetImage('assets/images/perfil.webp'),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: const Icon(
                              Icons.photo,
                              color: Color.fromARGB(255, 0, 0, 0),
                              size: 25.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Feliciana',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                InputTextFormField(
                  label: 'Nombre',
                  onChanged: profileCubit.nombreProfileChange,
                  erroMessage: nombreProfile.errorMessage,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputTextFormField(
                  label: 'Apellidos',
                  onChanged: profileCubit.apellidoProfilechange,
                  erroMessage: apellidoProfile.errorMessage,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputTextFormField(
                  label: 'Edad',
                  onChanged: profileCubit.edadProfileChange,
                  erroMessage: edadProfile.errorMessage,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputTextFormField(
                  label: 'Genero',
                  onChanged: profileCubit.generoProfileChange,
                  erroMessage: generoProfile.errorMessage,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputTextFormField(
                  label: 'Dni',
                  onChanged: profileCubit.dniProfileChange,
                  erroMessage: dniProfile.errorMessage,
                ),
                const SizedBox(
                  height: 20,
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
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SizedBox(
            width: 100,
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
                final router = GoRouter.of(context);
                profileCubit.cerrarSesion();
                router.go('/'); // Asegúrate de que '/login'
              },
              icon: const Icon(Icons.logout), // Ícono del botón
              label: const Text(
                'Cerrar Sesión',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ), // Etiqueta del botón
            ),
          ),
        ),
      ],
    );
  }
}
