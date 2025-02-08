import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_piano/ui/key_button.dart';
import 'package:learning_piano/utils/utils.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenSizeWidth = getScreenWidth(context);
    double whiteKeyWidth = screenSizeWidth / 15;
    double blackKeyWidth = whiteKeyWidth * 0.6;
    double blackKeyHeight = getScreenHeight(context) * .66 * 0.6;
    List<String> keyCodeList = [
      "C3",
      "D3",
      "E3",
      "F3",
      "G3",
      "A3",
      "B3",
      "C4",
      "D4",
      "E4",
      "F4",
      "G4",
      "A4",
      "B4",
      "C5"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Learning Piano", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Flexible(
            flex: (getScreenHeight(context) * .25).toInt(),
            child: Container(
              color: Colors.black,
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
                    keyCode: "Db3",
                  ),
                ),
                Positioned(
                  left: 2 * whiteKeyWidth - blackKeyWidth * .4,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "Eb3",
                  ),
                ),
                Positioned(
                  left: 4 * whiteKeyWidth - blackKeyWidth * .6,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "Gb3",
                  ),
                ),
                Positioned(
                  left: 5 * whiteKeyWidth - blackKeyWidth / 2,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "Ab3",
                  ),
                ),
                Positioned(
                  left: 6 * whiteKeyWidth - blackKeyWidth * .4,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "Bb3",
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
                    keyCode: "Db4",
                  ),
                ),
                Positioned(
                  left: 9 * whiteKeyWidth - blackKeyWidth * .4,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "Eb4",
                  ),
                ),
                Positioned(
                  left: 11 * whiteKeyWidth - blackKeyWidth * .6,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "Gb4",
                  ),
                ),
                Positioned(
                  left: 12 * whiteKeyWidth - blackKeyWidth / 2,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "Ab4",
                  ),
                ),
                Positioned(
                  left: 13 * whiteKeyWidth - blackKeyWidth * .4,
                  top: 0,
                  child: KeyButton(
                    width: blackKeyWidth,
                    height: blackKeyHeight,
                    isBlack: true,
                    keyCode: "Bb4",
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
