import 'package:flutter/material.dart';

class ForumScreen extends StatelessWidget {
  static const String name = 'forum_screen';
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foro'),
        centerTitle: true,
      ),
    );
  }
}
