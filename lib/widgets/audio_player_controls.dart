import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/audio_bloc.dart';
import '../bloc/audio_event.dart';
import '../bloc/audio_state.dart';

class AudioPlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioBloc, AudioState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon:
                  state.isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
              onPressed: () async {
                context.read<AudioBloc>().add(ToggleAudio());
              },
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: () {
                context.read<AudioBloc>().add(StopAudio());
              },
            ),
          ],
        );
      },
    );
  }
}
