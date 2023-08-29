import 'package:flutter/material.dart';

class RefranesMinigameScreen extends StatelessWidget {
  const RefranesMinigameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refranes'),
        centerTitle: true,
      ),
      body: CompleteProverbsGame(),
    );
  }
}

class CompleteProverbsGame extends StatefulWidget {
  @override
  _CompleteProverbsGameState createState() => _CompleteProverbsGameState();
}

class _CompleteProverbsGameState extends State<CompleteProverbsGame> {
  List<String> proverbs = [
    'Más vale tarde que',
    'En boca cerrada no entran',
    'El que mucho abarca poco'
  ];
  List<String> completedProverbs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Completa los refranes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: proverbs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    proverbs[index],
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: completedProverbs.contains(proverbs[index])
                      ? Icon(Icons.check, color: Colors.green)
                      : Icon(Icons.clear, color: Colors.red),
                  onTap: () {
                    _completeProverb(proverbs[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _completeProverb(String proverb) {
    setState(() {
      if (completedProverbs.contains(proverb)) {
        completedProverbs.remove(proverb);
      } else {
        completedProverbs.add(proverb);
      }
    });
  }
}
