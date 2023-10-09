import 'package:equatable/equatable.dart';

abstract class AudioEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlayAudio extends AudioEvent {
  final String asset;
  final String title;

  PlayAudio(this.asset, this.title);

  @override
  List<Object?> get props => [asset];
}

class ToggleAudio extends AudioEvent {}

class StopAudio extends AudioEvent {}
