import 'package:blog/ui/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AppTheme { light, dark }

final appThemeData = {
  AppTheme.light: ThemeData(
    shadowColor: primaryColor.withOpacity(0.25),
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: pageBackgroundColor,
    backgroundColor: backgroundColor,
    canvasColor: canvasColor,
    accentColor: accentColor,
  ),
  AppTheme.dark: ThemeData(
    shadowColor: primaryColor.withOpacity(0.25),
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: accentColor,
    backgroundColor: backgroundColor,
    canvasColor: accentColor,
    accentColor: accentColor,
  ),
};
