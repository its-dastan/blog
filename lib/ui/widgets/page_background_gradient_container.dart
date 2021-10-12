import 'package:blog/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class PageBackgroundGradientContainer extends StatelessWidget {
  const PageBackgroundGradientContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: UiUtils.buildLinearGradient(
        [
          Theme.of(context).scaffoldBackgroundColor,
          Theme.of(context).canvasColor
        ],
        Alignment.topCenter,
        Alignment.bottomCenter,
      )),
    );
  }
}
