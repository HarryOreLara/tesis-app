import 'package:flutter/material.dart';
class SignUpScreen extends StatelessWidget {
  static const String name = 'signup_screen';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: CurvedContainer(),
    );
  }
}

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(children: [
      ClipPath(
        clipper: MyClipper(),
        child: Container(
          color: Colors.white,
          height: 200,
          child: SizedBox(
              width: size.width * 0.1,
              child: const Center(
                  child: Text(
                'Registro',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ))),
        ),
      ),
      SizedBox(
        height: size.height * 0.07,
      ),
      SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: size.width * 1,
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
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: "Dni",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200))),
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: "Contraseña",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          FilledButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor: MaterialStateProperty.all(Colors.blue),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal:
                      40)), // Ajusta los valores para el espaciado interno
              minimumSize: MaterialStateProperty.all(
                  const Size(200, 50)), // Ajusta el tamaño mínimo del botón
            ),
            onPressed: () {
              print('Registrandome');
            },
            icon: const Icon(Icons.person),
            label: const Text(
              "Registrarme",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'O',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              print('Volver a iniciar sesion');
            },
            child: const Text(
              'Inicia Sesión',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    ]);
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height / 2);
    // path.quadraticBezierTo(
    //     size.width / 2, size.height, size.width, size.height - 50);

    path.cubicTo(size.width / 4, 3 * (size.height / 2), 3 * (size.width / 4),
        size.height / 2, size.width, size.height * 0.9);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
