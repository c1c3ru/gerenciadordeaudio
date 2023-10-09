import 'package:equatable/equatable.dart';

import '../models/audio.dart';

class AudioState extends Equatable {
  final AudioModel? currentAudio;
  final bool isPlaying;

  AudioState({required this.currentAudio, required this.isPlaying});

  factory AudioState.initial() {
    return AudioState(currentAudio: null, isPlaying: false);
  }

  AudioState copyWith({AudioModel? currentAudio, bool? isPlaying}) {
    return AudioState(
      currentAudio: currentAudio ?? this.currentAudio,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }

  @override
  List<Object?> get props => [currentAudio, isPlaying];
}
