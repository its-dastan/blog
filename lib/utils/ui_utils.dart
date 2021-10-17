import 'package:flutter/cupertino.dart';

class UiUtils {
  static String getImagePath(String imageName) {
    return "assets/images/$imageName";
  }

  static LinearGradient buildLinearGradient(
      List<Color> colors, Alignment begin, Alignment end) {
    return LinearGradient(colors: colors, begin: begin, end: end);
  }
}
