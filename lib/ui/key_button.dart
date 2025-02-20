
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_piano/presentation/styles/colors.dart';
import 'package:learning_piano/presentation/styles/dimens.dart';
import 'package:learning_piano/provider/midi_provider.dart';
import 'package:learning_piano/provider/service_locator.dart';

class KeyButton extends ConsumerWidget {
  const KeyButton({
    super.key,
    required this.width,
    this.height = double.infinity,
    this.isBlack = false,
    required this.keyCode,
  });

  final double width;
  final double height;
  final bool isBlack;
  final String keyCode;

  Future<void> _playNoteFromKeyCode(WidgetRef ref) async {
    int soundfontId = ref.read(soundfontIdProvider);
    List<String> keyCodeSplitList = keyCode.split(":");
    int midiKey = DI<MidiProvider>().getMidiKey(keyCodeSplitList[0], int.parse(keyCodeSplitList[1]));
    DI<MidiProvider>().playNote(sfId: soundfontId, channel: 0, key: midiKey, velocity: 127);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _playNoteFromKeyCode(ref),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isBlack ? kBlackPianoKey : kWhitePianoKey,
          border: Border.all(
            width: 1,
            color: kBlackPianoKey,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(kRadiusMain),
            bottomRight: Radius.circular(kRadiusMain),
          ),
        ),
        child: SizedBox.shrink(),
      ),
    );
  }
}
