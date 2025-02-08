import 'package:flutter/material.dart';

SizedBox gapW(double width) => SizedBox(width: width);

SizedBox gapH(double height) => SizedBox(height: height);

double getScreenWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}
