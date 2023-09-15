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
            if (state.isPlaying)
              IconButton(
                icon: Icon(Icons.pause),
                onPressed: () {
                  context.read<AudioBloc>().add(PauseAudio());
                },
              ),
            if (!state.isPlaying && state.currentAudio != null)
              IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  context.read<AudioBloc>().add(
                    PlayAudio(
                      state.currentAudio!.url,
                      state.currentAudio!.title,
                    ),
                  );
                },
              ),
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {
                if (state.currentAudio != null) {
                  context.read<AudioBloc>().add(
                    PlayAudio(
                      state.currentAudio!.url,
                      state.currentAudio!.title,
                    ),
                  );
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.pause), // Ícone de pausar
              onPressed: () {
                context.read<AudioBloc>().add(PauseAudio());
              },
            ),
            IconButton(
              icon: Icon(Icons.stop), // Ícone de parar
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
