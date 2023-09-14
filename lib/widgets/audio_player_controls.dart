import 'package:audioplayers_platform_interface/src/api/audio_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/audio_bloc.dart';
import '../bloc/audio_event.dart';
import '../bloc/audio_state.dart'; // Import audio events

class AudioPlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioBloc, AudioState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state.isPlaying)
              IconButton(
                icon: Icon(Icons.pause),
                onPressed: () {
                  context.read<AudioBloc>().add(PauseAudio());
                },
              )
            else
              IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  if (state.currentAudio != null) {
                    context.read<AudioBloc>().add(
                      PlayAudio(state.currentAudio!.title, state.currentAudio!.url),
                    );
                  }
                },
              ),
          ],
        );
      },
    );
  }
}
