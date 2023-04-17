import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int note) {
    final audioPlayer = AudioPlayer();
    audioPlayer.play(
      AssetSource('note$note.wav'),
    );
  }

  Expanded keyBuild(color, soundNumber) {
    var expanded = Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color, // Text Color
        ),
        onPressed: () {
          playSound(soundNumber);
        },
        child: null, //Text('first sound'),
      ),
    );
    return expanded;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              keyBuild(Colors.red, 1),
              keyBuild(Colors.yellow, 2),
              keyBuild(Colors.green, 3),
              keyBuild(Colors.blue, 4),
              keyBuild(Colors.purpleAccent, 5),
              keyBuild(Colors.deepPurple, 6),
              keyBuild(Colors.pink, 7),
            ],
          ),
        ),
      ),
    );
  }
}
