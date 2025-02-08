import 'package:audioplayers/audioplayers.dart';

class AudioProvider {
  final AudioPlayer audioPlayer;

  AudioProvider(this.audioPlayer);

  Future<void> play(String path) async {
    audioPlayer.play(AssetSource(path));
  }
}
