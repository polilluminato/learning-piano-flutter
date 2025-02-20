import 'package:flutter_midi_pro/flutter_midi_pro.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_piano/utils/utils.dart';

final soundfontIdProvider = StateProvider<int>((ref) => 0);

class MidiProvider {
  late final MidiPro _midiPro;

  MidiProvider() {
    _midiPro = MidiPro();
  }

  Future<int> loadSoundfont({
    required String path,
    required int bank,
    required int program,
  }) async {
    final int sfId =
        await _midiPro.loadSoundfont(path: path, bank: bank, program: program);
    return sfId;
  }

  Future<void> selectInstrument({
    required int sfId,
    required int channel,
    required int bank,
    required int program,
  }) async {
    await _midiPro.selectInstrument(
        sfId: sfId, channel: channel, bank: bank, program: program);
  }

  Future<void> playNote({
    required int sfId,
    required int channel,
    required int key,
    required int velocity,
  }) async {
    await _midiPro.playNote(
        sfId: sfId, channel: channel, key: key, velocity: velocity);
  }

  int getMidiKey(String note, int octave) {
    final notes = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];
    final noteIndex = notes.indexOf(note.toUpperCase());

    if (noteIndex == -1) {
      throw ArgumentError("Nota non valida: $note");
    }

    return (octave + 1) * 12 + noteIndex;
  }
}
