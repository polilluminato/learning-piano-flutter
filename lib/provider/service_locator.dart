// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_piano/app/app_router.dart';
import 'package:learning_piano/provider/midi_provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

final DI = GetIt.I;

void setupLocator() {
  DI
    ..registerSingleton<AppRouter>(AppRouter())
    ..registerSingleton<Talker>(
      Talker(
        settings: TalkerSettings(
          enabled: true,
          useConsoleLogs: kDebugMode,
        ),
      ),
    )
    ..registerLazySingleton<MidiProvider>(() => MidiProvider());
}
