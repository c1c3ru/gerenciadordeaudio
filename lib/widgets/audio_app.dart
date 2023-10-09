import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/audio_bloc.dart';
import '../bloc/audio_event.dart';
import '../models/audio.dart';
import '../ultil/file_ultil.dart';
import 'audio_list.dart';
import 'audio_player_controls.dart';

class AudioApp extends StatelessWidget {
  final List<AudioModel> audioList;

  AudioApp(this.audioList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gerenciador de Áudios")),
      body: Column(
        children: [
          Expanded(
            child: AudioList(
              audios: audioList,
              onAudioSelected: (audio) async {
                bool fileExists = await FileUtil.doesFileExist('assets/${audio.asset}');
                print('O arquivo de áudio existe: $fileExists');

                if (fileExists) {
                  // Use o URI correto para o arquivo de áudio
                  Uri audioUri = Uri.parse(getAudioUri(audio.asset));
                  final audioBloc = BlocProvider.of<AudioBloc>(context);
                  audioBloc.add(PlayAudio(audio.asset, audioUri.toString()));
                } else {
                  print('Arquivo de áudio não encontrado.');
                }
              },
            ),
          ),
          AudioPlayerControls(),
        ],
      ),
    );
  }
}
