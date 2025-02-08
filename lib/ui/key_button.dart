import 'package:flutter/material.dart';
import 'package:learning_piano/utils/audio_utils.dart';

class KeyButton extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        playNota(keyCode);
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isBlack ? Colors.black : Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
        ),
        child: SizedBox.shrink(),
      ),
    );
  }
}
