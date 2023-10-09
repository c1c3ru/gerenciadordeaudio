// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'models/audio.dart';
import 'widgets/audio_app.dart';
import 'bloc/audio_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BlocProvider<AudioBloc>(
      create: (context) => AudioBloc(),
      child: AudioApp(audioList),
    ),
  ));
}
