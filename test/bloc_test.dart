import 'package:audio_manager_app/bloc/audio_bloc.dart';
import 'package:audio_manager_app/bloc/audio_event.dart';
import 'package:audio_manager_app/bloc/audio_state.dart';
import 'package:audio_manager_app/models/audio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('AudioBloc', () {
    late AudioBloc audioBloc;

    setUp(() {
      audioBloc = AudioBloc();
    });

    tearDown(() {
      audioBloc.close();
    });

    test('initial state is correct', () {
      expect(audioBloc.state, AudioState.initial());
    });

    blocTest<AudioBloc, AudioState>(
      'emits [] when nothing is added',
      build: () => audioBloc,
      expect: () => [],
    );

    blocTest<AudioBloc, AudioState>(
      'emits [AudioState] when PlayAudio is added.',
      build: () => audioBloc,
      act: (bloc) => bloc.add(PlayAudio('risk-136788.mp3', 'Test')),
      expect: () => [AudioState(currentAudio: AudioModel(title: 'Test', asset: 'risk-136788.mp3'), isPlaying: true)],
    );
  });
}
