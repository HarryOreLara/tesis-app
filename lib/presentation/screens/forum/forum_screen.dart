import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForumScreen extends StatelessWidget {
  static const String name = 'forum_screen';
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foro'),
        centerTitle: true,
        leading: IconButton(
            color: Colors.black,
            onPressed: () {
              context.go('/home');
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: _CuerpoForo(),
    );
  }
}

class Post {
  final String question;
  final List<String> responses;

  Post(this.question, this.responses);
}

class _CuerpoForo extends StatelessWidget {
  final List<Post> posts = [
    Post('How to get started with Flutter?', [
      'Check out the official documentation.',
      'Join the Flutter community.'
    ]),
    Post('Best practices for state management?', [
      'Use Provider or Riverpod for simple apps.',
      'Consider using BLoC for more complex apps.'
    ]),
    Post('Flutter vs React Native: Which is better?', [
      'It depends on your project requirements.',
      'Both have their strengths and weaknesses.'
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostDetailScreen(post: posts[index])),
              );
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      posts[index].question,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Responses: ${posts[index].responses.length}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              post.question,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: post.responses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.chat_bubble_outline),
                  title: Text(post.responses[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
