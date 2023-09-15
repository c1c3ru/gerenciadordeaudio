import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/audio.dart';
import 'audio_event.dart';
import 'audio_state.dart';

class AudioBloc extends Bloc<AudioEventBloc, AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioBloc() : super(AudioState.initial()) {
    on<PlayAudio>(_onPlayAudio);
  }

  Future<void> _onPlayAudio(PlayAudio event, Emitter<AudioState> emit) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(event.audioUrl as Source);
    emit(state.copyWith(currentAudio: Audio(title: "", url: event.audioUrl), isPlaying: true));
  }

  Stream<AudioState> mapEventToState(AudioEventBloc event) async* {
    if (event is PauseAudio) {
      await _audioPlayer.pause();
      yield state.copyWith(isPlaying: false);
    }
  }
}
