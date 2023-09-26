import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tesis_app/presentation/widgets/shared/message_field_box.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

class AssistantScreen extends StatelessWidget {
  static const String name = 'assistant_screen';
  const AssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/home'); // Add this line to navigate back
          },
        ),
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.stylist.co.uk/images/app/uploads/2022/06/01105352/jennifer-aniston-crop-1654077521-1390x1390.jpg?w=256&h=256&fit=max&auto=format%2Ccompress'),
              ),
            ),
            SizedBox(width: 8.0),
            Text('Olivia'),
          ],
        ),
        centerTitle: true,
      ),
      body: Data(),
    );
  }
}

class Data extends StatelessWidget {
  final List<String> suggestions = [
    "¿Cuál es el clima hoy?",
    "Cuéntame un chiste.",
    "¿Qué noticias tienes?",
    "Sugerencia 1",
    "Sugerencia 2",
    // Agrega más sugerencias aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(suggestions[index]),
                onTap: () {
                  // Aquí puedes manejar la acción cuando se selecciona una sugerencia
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Seleccionaste:'),
                        content: Text(suggestions[index]),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cerrar'),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Escribe tu pregunta aquí...',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (text) {
              // Aquí puedes manejar la acción cuando se envía una pregunta
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Pregunta enviada:'),
                    content: Text(text),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cerrar'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}



// import 'package:flutter/material.dart';

// class QuestionScreen extends StatefulWidget {
//   @override
//   _QuestionScreenState createState() => _QuestionScreenState();
// }

// class _QuestionScreenState extends State<QuestionScreen> {
//   String question = ""; // Pregunta actual
//   int userRating = 0; // Puntuación del usuario

//   Future<void> loadQuestion() async {
//     // Hacer una solicitud a la API para cargar la próxima pregunta
//     // Actualiza la variable "question" con la pregunta recibida
//   }

//   void submitAnswer() {
//     // Envía la respuesta del usuario a través de una solicitud a la API
//     // Puede incluir la respuesta y la puntuación del usuario
//     // Luego llama a "loadQuestion" para cargar la siguiente pregunta
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Carga la primera pregunta al iniciar la pantalla
//     loadQuestion();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Preguntas y respuestas'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Pregunta:',
//               style: TextStyle(fontSize: 24),
//             ),
//             Text(
//               question,
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Tu puntuación:',
//               style: TextStyle(fontSize: 24),
//             ),
//             Text(
//               userRating.toString(),
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: submitAnswer,
//               child: Text('Enviar Respuesta'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: QuestionScreen(),
//   ));
// }
