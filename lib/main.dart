import 'package:flutter/material.dart';
import 'models/audio.dart';
import 'widgets/audio_app.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AudioApp([
      Audio(title: "Audio 1", url: "assets/a-long-way-166385.mp3"),
      Audio(title: "Audio 2", url: "assets/dark-mystery-trailer-taking-our-time-131566.mp3"),
      Audio(title: "Audio 3", url: "assets/leonell-cassio-the-blackest-bouquet-118766.mp3"),
      Audio(title: "Audio 4", url: "assets/risk-136788.mp3"),
    ]),
  ));
}




