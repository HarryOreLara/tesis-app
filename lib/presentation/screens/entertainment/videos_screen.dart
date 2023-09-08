import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VideosScreen extends StatelessWidget {
  static const String name = 'videos_screen';

  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videos'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.go('/entertainment');
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
    );
  }
}
