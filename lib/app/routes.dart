import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const home = "/";
  static const splash = "splash";

  static Route<dynamic> onGenerateRouted(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return CupertinoPageRoute(builder: (context) => const Scaffold());

      default:
        return CupertinoPageRoute(builder: (context) => const Scaffold());
    }
  }
}
