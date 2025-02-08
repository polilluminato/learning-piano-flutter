import 'package:learning_piano/provider/audio_provider.dart';
import 'package:learning_piano/provider/service_locator.dart';

Future<void> playNota(String keyCode) async {
  DI<AudioProvider>().play("note/$keyCode.mp3");
}
