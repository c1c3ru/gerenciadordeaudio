import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/audio_bloc.dart';
import '../bloc/audio_event.dart';
import '../models/audio.dart';
import 'audio_list.dart';
import 'audio_player_controls.dart';

class AudioApp extends StatelessWidget {
  final List<Audio> audios;

  AudioApp(this.audios);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gerenciador de Áudios")),
      body: BlocProvider(
        create: (context) => AudioBloc(),
        child: Column(
          children: [
            Expanded(
              child: AudioList(
                audios: audios,
                onAudioSelected: (audio) {
                  final audioBloc = BlocProvider.of<AudioBloc>(context);
                  audioBloc.add(PlayAudio(audio.url, audio.title));
                },
              ),
            ),
            AudioPlayerControls(),
          ],
        ),
      ),
    );
  }
}
