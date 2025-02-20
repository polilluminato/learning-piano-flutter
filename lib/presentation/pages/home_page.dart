import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_piano/l10n/l10n.dart';
import 'package:learning_piano/presentation/styles/colors.dart';
import 'package:learning_piano/presentation/styles/dimens.dart';
import 'package:learning_piano/provider/midi_provider.dart';
import 'package:learning_piano/provider/service_locator.dart';
import 'package:learning_piano/ui/key_button.dart';
import 'package:learning_piano/utils/utils.dart';


@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  Future<void> _loadSoundfont(WidgetRef ref) async {
    int soundfontId = await DI<MidiProvider>().loadSoundfont(
      path: "assets/soundfont/TimGM6mb.sf2",
      bank: 0,
      program: 0,
    );
    ref.read(soundfontIdProvider.notifier).update((state) => soundfontId);
  }

  Future<void> _selectInstrument(WidgetRef ref) async {
    int soundfontId = ref.read(soundfontIdProvider);
    await DI<MidiProvider>().selectInstrument(
      sfId: soundfontId,
      channel: 0,
      bank: 0,
      program: 0,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenSizeWidth = getScreenWidth(context);
    double whiteKeyWidth = screenSizeWidth / 15;
    double blackKeyWidth = whiteKeyWidth * 0.6;
    double blackKeyHeight = getScreenHeight(context) * .66 * 0.6;
    List<String> keyCodeList = [
      "C:3",
      "D:3",
      "E:3",
      "F:3",
      "G:3",
      "A:3",
      "B:3",
      "C:4",
      "D:4",
      "E:4",
      "F:4",
      "G:4",
      "A:4",
      "B:4",
      "C:5"
    ];

    return Scaffold(
      backgroundColor: kPianoColorPrimary,
      appBar: AppBar(
        title: Text("Learning Piano".hardcoded, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kPianoColorPrimary,
      ),
      body: Column(
        children: [
          SizedBox(
            height: getScreenHeight(context) * .25,
            child: Row(
              spacing: kSpaceMain,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => _loadSoundfont(ref),
                  child: Text("Load Soundfont".hardcoded),
                ),
                ElevatedButton(
                  onPressed: () => _selectInstrument(ref),
                  child: Text("Select Instrument".hardcoded),
                ),
              ],
            ),
          ),
          Flexible(
            flex: (getScreenHeight(context) * .75).toInt(),
            child: Stack(
              children: [
                //Tasti bianchi
                Row(
                  children: List.generate(
                    15,
                    (index) => Expanded(
                      child: KeyButton(
                        width: whiteKeyWidth,
                        keyCode: keyCodeList[index],
                      ),
                    ),
                  ),
                ),
                //Tasti neri 1 ottava
                Positioned(
                  left: whiteKeyWidth - blackKeyWidth * .6,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "C#:3",
                  ),
                ),
                Positioned(
                  left: 2 * whiteKeyWidth - blackKeyWidth * .4,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "D#:3",
                  ),
                ),
                Positioned(
                  left: 4 * whiteKeyWidth - blackKeyWidth * .6,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "F#:3",
                  ),
                ),
                Positioned(
                  left: 5 * whiteKeyWidth - blackKeyWidth / 2,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "G#:3",
                  ),
                ),
                Positioned(
                  left: 6 * whiteKeyWidth - blackKeyWidth * .4,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "A#:3",
                  ),
                ),
                //Tasti neri 2 ottava
                Positioned(
                  left: 8 * whiteKeyWidth - blackKeyWidth * .6,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "C#:4",
                  ),
                ),
                Positioned(
                  left: 9 * whiteKeyWidth - blackKeyWidth * .4,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "D#:4",
                  ),
                ),
                Positioned(
                  left: 11 * whiteKeyWidth - blackKeyWidth * .6,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "F#:4",
                  ),
                ),
                Positioned(
                  left: 12 * whiteKeyWidth - blackKeyWidth / 2,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "G#:4",
                  ),
                ),
                Positioned(
                  left: 13 * whiteKeyWidth - blackKeyWidth * .4,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "A#:4",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
