// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_piano/app/app.dart';
import 'package:learning_piano/provider/service_locator.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(768, 480),
  );

  if (UniversalPlatform.isDesktop) {
    await windowManager.ensureInitialized();
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(ProviderScope(child: App()));
}
