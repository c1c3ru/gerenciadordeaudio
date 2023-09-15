import 'package:audioplayers/audioplayers.dart';
import '../models/audio.dart';

class AudioManager {
  static AudioPlayer _audioPlayer = AudioPlayer();

  static Future<void> play(Audio audio) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(audio.url as Source);
  }

  static Future<void> pause() async {
    await _audioPlayer.pause();
  }

  static Future<void> stop() async {
    await _audioPlayer.stop();
  }

  static Future<Duration?> getDuration() async {
    return await _audioPlayer.getDuration();
  }

  static Future<Duration?> getCurrentPosition() async {
    return await _audioPlayer.getCurrentPosition();
  }
}

// ...

// void _playAudio(BuildContext context, Audio audio) {
//   final audioBloc = BlocProvider.of<AudioBloc>(context);
//   audioBloc.add(PlayAudio(audio.url, audio.title));
// }

