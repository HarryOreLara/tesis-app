import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicScreen extends StatelessWidget {
  static const String name = 'music_screen';

  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Musica'),
        centerTitle: true,
      ),
      //body: MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentSong = 'Canción actual';

  void playPauseMusic() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play(UrlSource(''));
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void stopMusic() async {
    await audioPlayer.stop();

    setState(() {
      isPlaying = false;
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reproductor de Música'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentSong,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              iconSize: 64,
              onPressed: playPauseMusic,
            ),
            IconButton(
              icon: Icon(Icons.stop),
              iconSize: 48,
              onPressed: stopMusic,
            ),
          ],
        ),
      ),
    );
  }
}
