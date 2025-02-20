import 'package:flutter/material.dart';
import 'package:learning_piano/provider/service_locator.dart';
import 'package:talker_flutter/talker_flutter.dart';

void printLog(message) {
  DI<Talker>().debug(message);
}

SizedBox gapW(double width) => SizedBox(width: width);

SizedBox gapH(double height) => SizedBox(height: height);

double getScreenWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}


