import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AssistantScreen extends StatelessWidget {
  static const String name = 'assistant_screen';

  const AssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          flexibleSpace: const _CustomAppbar(),
          centerTitle: true,
        ),
      ),
      body: QuestionChatScreen(),
      //body: const _CardAsistenteLogo()
    );
  }
}

class _CustomAppbar extends StatelessWidget {
  const _CustomAppbar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 14, 199, 255),
            Color.fromARGB(255, 0, 130, 255),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}

class _CardAsistenteLogo extends StatelessWidget {
  const _CardAsistenteLogo();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        FadeInDownBig(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100)),
            child: SizedBox(
              width: size.width * 1,
              height: size.height * 0.2,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 7, 197, 255),
                  Color.fromARGB(255, 0, 109, 255),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/medicines.jpg'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        child: Text(
                      'Hola soy yu asistente virtual',
                      style: TextStyle(fontSize: 20),
                    ))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class QuestionChatScreen extends StatefulWidget {
  @override
  _QuestionChatScreenState createState() => _QuestionChatScreenState();
}

class _QuestionChatScreenState extends State<QuestionChatScreen> {
  final List<Question> questions = [
    Question('¿Te sientes bien hoy?'),
    Question('¿Estás disfrutando el día?'),
    Question('¿Te gustaría hacer algo especial?'),
  ];

  int currentQuestionIndex = 0;
  bool canAnswer = true;

  void _nextQuestion(bool isPositiveResponse) {
    setState(() {
      questions[currentQuestionIndex].response = isPositiveResponse;
      currentQuestionIndex++;

      if (currentQuestionIndex >= questions.length) {
        canAnswer = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Interactivo')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: currentQuestionIndex + 1,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(questions[index].text),
                  subtitle: index < currentQuestionIndex
                      ? Text(
                          'Usuario: ${questions[index].response ? 'Bien' : 'Mal'}')
                      : null,
                );
              },
            ),
          ),
          if (currentQuestionIndex < questions.length)
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: canAnswer ? () => _nextQuestion(true) : null,
                  child: Text('Bien'),
                ),
                ElevatedButton(
                  onPressed: canAnswer ? () => _nextQuestion(false) : null,
                  child: Text('Mal'),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class Question {
  final String text;
  bool response;

  Question(this.text) : response = false;
}
