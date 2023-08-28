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
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      posts[index].question,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Responses: ${posts[index].responses.length}',
                      style: TextStyle(color: Colors.grey),
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

  PostDetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              post.question,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: post.responses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.chat_bubble_outline),
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
