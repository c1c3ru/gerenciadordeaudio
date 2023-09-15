import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/audio_bloc.dart';
import 'bloc/audio_event.dart';
import 'models/audio.dart';
import 'widgets/audio_list.dart';
import 'widgets/audio_player_controls.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final List<Audio> audios = [
    Audio(title: "Audio 1", url: "assets/a-long-way-166385.mp3"),
    Audio(title: "Audio 2", url: "assets/dark-mystery-trailer-taking-our-time-131566.mp3"),
    Audio(title: "Audio 3", url: "assets/leonell-cassio-the-blackest-bouquet-118766.mp3"),
    Audio(title: "Audio 4", url: "assets/risk-136788.mp3"),
    // Adicione mais áudios conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AudioBloc(),
        child: AudioApp(audios: audios),
      ),
    );
  }
}

class AudioApp extends StatelessWidget {
  final List<Audio> audios;

  AudioApp({required this.audios});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gerenciador de Áudios")),
      body: Column(
        children: [
          Expanded(
            child: AudioList(
              audios: audios,
              onAudioSelected: (audio) {
                final audioBloc = BlocProvider.of<AudioBloc>(context);
                audioBloc.add(PlayAudio(audio.url,audio.title));
              },
            ),
          ),
          AudioPlayerControls(),
        ],
      ),
    );
  }
}
