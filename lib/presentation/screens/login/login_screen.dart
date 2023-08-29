import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/blocs/login/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login_screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: BlocProvider(
      create: (context) => LoginCubit(),
      child: _CustomLogin(size: size),
    ));
  }
}

class _CustomLogin extends StatelessWidget {
  const _CustomLogin({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        Colors.blue.shade900,
        Colors.blue.shade800,
        Colors.blue.shade400,
        // Color(0xFFB81736),
        // Color(0xff281537),
      ])),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Iniciar Sesion',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Text(
                    'Bienvenido',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ]),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Expanded(
            child: Container(
              width: size.width * 1,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: _FormLogin(size: size),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormLogin extends StatefulWidget {
  const _FormLogin({
    required this.size,
  });

  final Size size;

  @override
  State<_FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<_FormLogin> {
  @override
  Widget build(BuildContext context) {
    final loginCubit = context.watch<LoginCubit>();
    final dni = loginCubit.state.dniProfile;
    final password = loginCubit.state.passwordLogin;

    return Form(
      child: ListView(
        children: [
          SizedBox(
            height: widget.size.height * 0.04,
          ),
          Container(
            width: widget.size.width * 1,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 6, 83, 156),
                      blurRadius: 10,
                      offset: Offset(0, 2))
                ]),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade200))),
                  child: TextFormField(
                    onChanged: loginCubit.dniLoginChange,
                    decoration: InputDecoration(
                        errorText: dni.errorMessage,
                        hintText: "Dni",
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade200))),
                  child: TextFormField(
                    onChanged: loginCubit.passwordLoginchange,
                    decoration: InputDecoration(
                        errorText: password.errorMessage,
                        hintText: "Contraseña",
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Olvido la contraseña?",
            style: TextStyle(color: Color.fromARGB(255, 58, 58, 58)),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () async {
              bool ok = await loginCubit.login();
              if (ok) {
                context.push('/home');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Error en el inicio de sesión')),
                );
              }
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue.shade900,
              ),
              child: const Center(
                child: Text(
                  "Iniciar Sesion",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Ó',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              context.push('/signup');
            },
            child: const Text(
              'Registrate',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 102, 185)),
            ),
          )
        ],
      ),
    );
  }
}

class SomeOtherWidget extends StatelessWidget {
  const SomeOtherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error en el inicio de sesión'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              color: Colors.red,
              size: 64.0,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Hubo un error al iniciar sesión.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Regresar a la pantalla anterior
              },
              child: const Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }
}
