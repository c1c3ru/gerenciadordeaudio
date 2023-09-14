import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/audio.dart';
import 'audio_event.dart';
import 'audio_state.dart';

class AudioBloc extends Bloc<AudioEventBloc, AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  AudioBloc() : super(AudioState.initial());

  Stream<AudioState> mapEventToState(AudioEventBloc event) async* {
    if (event is PlayAudio) {
      await _audioPlayer.stop(); // Pare a reprodução anterior, se houver
      await _audioPlayer.play(event.audioUrl as Source);
      yield state.copyWith(currentAudio: Audio(title: "", url: event.audioUrl), isPlaying: true);
    } else if (event is PauseAudio) {
      await _audioPlayer.pause();
      yield state.copyWith(isPlaying: false);
    }
  }
}
