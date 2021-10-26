import 'package:blog/ui/screens/demo.dart';
import 'package:blog/ui/screens/intro_screens/auth_screens/signin.dart';
import 'package:blog/ui/screens/intro_screens/auth_screens/signup.dart';
import 'package:blog/ui/screens/intro_screens/onboarding_screen.dart';
import 'package:blog/ui/screens/splash_screen/splash_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const home = "/";
  static const splash = "splash";
  static const demo = "demo";
  static const onboardingScreen = "onboardingScreen";
  static const signin = "signin";
  static const signup = "signup";

  static Route<dynamic> onGenerateRouted(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());

      case demo:
        return CupertinoPageRoute(builder: (context) => const Demo());
      case signin:
        return CupertinoPageRoute(builder: (context) => const Signin());
      case signup:
        return CupertinoPageRoute(builder: (context) => const SignUp());

      case onboardingScreen:
        return CupertinoPageRoute(
            builder: (context) => const OnboardingScreen());

      default:
        return CupertinoPageRoute(builder: (context) => const Scaffold());
    }
  }
}
