import 'dart:async';
import 'package:bloc/bloc.dart';
import '../models/audio.dart';
import '../widgets/audio_manager_bloc.dart';
import 'audio_event.dart';
import 'audio_state.dart';

class AudioBloc extends Bloc<AudioEventBloc, AudioState> {
  AudioBloc() : super(AudioState.initial()) {
    on<PlayAudio>(_onPlayAudio);
    on<PauseAudio>(_onPauseAudio);
    on<StopAudio>(_onStopAudio);  // Adicionando tratamento para StopAudio
  }

  Future<void> _onPlayAudio(PlayAudio event, Emitter<AudioState> emit) async {
    await AudioManager.play(event.audioUrl as Audio);
    emit(state.copyWith(
        currentAudio: Audio(title: event.title, url: event.audioUrl),
        isPlaying: true));
  }

  Future<void> _onPauseAudio(PauseAudio event, Emitter<AudioState> emit) async {
    await AudioManager.pause();
    emit(state.copyWith(isPlaying: false));
  }

  Future<void> _onStopAudio(StopAudio event, Emitter<AudioState> emit) async {
    await  StopAudio();  // Parando a reprodução
    emit(state.copyWith(isPlaying: false));
  }

  Stream<AudioState> mapEventToState(AudioEventBloc event) async* {
    if (event is PauseAudio) {
      await PauseAudio();
      yield state.copyWith(isPlaying: false);
    }
  }
}
