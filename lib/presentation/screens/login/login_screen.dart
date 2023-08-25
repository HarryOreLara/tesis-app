import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login_screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        Colors.orange.shade900,
        Colors.orange.shade800,
        Colors.orange.shade400,
      ])),
      child: const Column(
        children: [
          Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 40),
          )
        ],
      ),
    ));
  }
}

// class _CustomUno extends StatelessWidget {
//   const _CustomUno({
//     super.key,
//     required this.size,
//   });

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//     children: [
//       Container(
//         height: size.height * 0.3,
//         width: size.width * 1,
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [
//           Color(0xffb81736),
//           Color(0xff281537),
//         ])),
//         child: const Padding(
//           padding: EdgeInsets.only(top: 60.0, left: 22.0),
//           child: Text(
//             'Inicia Sesion',
//             style: TextStyle(
//                 fontSize: 30.0,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//       Container(
//         alignment: Alignment.bottomCenter,
//         decoration: const BoxDecoration(
//             color: Color.fromARGB(255, 255, 255, 255),
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(40),
//                 topRight: Radius.circular(40))),
//         width: size.width * 1,
//         height: size.height * 0.7,
//       )
//     ],
//       ),
//     );
//   }
// }
