import 'package:bloc/bloc.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import '../models/audio.dart';
import 'audio_event.dart';
import 'audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();
  List<AudioModel> audioList = [];

  AudioBloc() : super(AudioState.initial()) {
    _audioPlayer.playlistFinished.listen((event) {
      add(StopAudio());
    });

    on<ToggleAudio>(_onToggleAudio);
    on<StopAudio>((event, emit) {
      _audioPlayer.stop();
    });
    on<PlayAudio>(_onPlayAudio);
  }

  void _onPlayAudio(PlayAudio event, Emitter<AudioState> emit) async {
    // Supondo que você deseja limpar a lista de reprodução e adicionar a nova música a cada reprodução
    audioList.clear();
    audioList.add(AudioModel(title: event.title, asset: event.asset));

    await _audioPlayer.open(
      Playlist(
        audios: audioList.map((audioModel) {
          return Audio.file(
            audioModel.asset, // Use audioModel.asset como o caminho do arquivo
            metas: Metas(
              title: audioModel.title,
            ),
          );
        }).toList(),
      ),
      showNotification: true,
      headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
    );

    await _audioPlayer.play();

    emit(state.copyWith(
      currentAudio: AudioModel(title: event.title, asset: event.asset),
      isPlaying: true,
    ));
  }

  Stream<AudioState> _mapPlayAudioToState(PlayAudio event) async* {
    audioList.clear();
    audioList.add(AudioModel(title: event.title, asset: event.asset));

    await _audioPlayer.open(
      Playlist(
        audios: audioList.map((audioModel) {
          return Audio.file(audioModel.asset);
        }).toList(),
      ),
      showNotification: true,
      headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
    );

    await _audioPlayer.play();

    yield state.copyWith(
      currentAudio: AudioModel(title: event.title, asset: event.asset),
      isPlaying: true,
    );
  }
  void _onToggleAudio(ToggleAudio event, Emitter<AudioState> emit) async {
    if (state.isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
    emit(state.copyWith(isPlaying: !state.isPlaying));
  }

  Stream<AudioState> mapEventToState(AudioEvent event) async* {
    if (event is PlayAudio) {
      yield* _mapPlayAudioToState(event);
    } else if (event is StopAudio) {
      yield* _mapStopAudioToState();
    }
  }


  Stream<AudioState> _mapStopAudioToState() async* {
    await _audioPlayer.stop();
    yield state.copyWith(isPlaying: false);
  }
}
