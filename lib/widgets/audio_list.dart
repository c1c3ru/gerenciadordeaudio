import 'package:flutter/material.dart';
import '../models/audio.dart';

class AudioList extends StatelessWidget {
  final List<Audio> audios;
  final Function(Audio) onAudioSelected;

  AudioList({required this.audios, required this.onAudioSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: audios.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(audios[index].title),
          onTap: () => onAudioSelected(audios[index]),
        );
      },
    );
  }
}
