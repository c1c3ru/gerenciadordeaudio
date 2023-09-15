import 'package:equatable/equatable.dart';

abstract class AudioEventBloc extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlayAudio extends AudioEventBloc {
  final String audioUrl;
  final String title;

  PlayAudio(this.audioUrl, this.title);

  @override
  List<Object?> get props => [audioUrl];
}

class PauseAudio extends AudioEventBloc {}

class StopAudio extends AudioEventBloc {}
