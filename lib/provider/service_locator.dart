// ignore_for_file: non_constant_identifier_names

import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_piano/app/app_router.dart';
import 'package:learning_piano/provider/audio_provider.dart';

final DI = GetIt.I;

void setupLocator() {
  DI
    ..registerSingleton<AppRouter>(AppRouter())
    ..registerLazySingleton<AudioProvider>(() => AudioProvider(AudioPlayer()));
}
