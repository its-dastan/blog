import 'package:blog/app/routes.dart';
import 'package:blog/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class SplashScreenCopy extends StatefulWidget {
  const SplashScreenCopy({Key? key}) : super(key: key);

  @override
  _SplashScreenCopyState createState() => _SplashScreenCopyState();
}

class _SplashScreenCopyState extends State<SplashScreenCopy>
    with TickerProviderStateMixin {
  late AnimationController rotateController;
  late Animation<double> rotateAnimation;
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  void animationStatusListener(AnimationStatus animationStatus) {}

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    rotateController.dispose();
    super.dispose();
  }

  void initAnimation() {
    rotateController = AnimationController(
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
      vsync: this,
    );

    rotateAnimation =
        CurvedAnimation(parent: rotateController, curve: Curves.linear);
    rotateController
        .repeat(
          min: 0,
          max: 1,
          period: const Duration(seconds: 2),
        )
        .whenComplete(() => navigateToNextScreen());
    scaleController = AnimationController(
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
      vsync: this,
    );

    scaleAnimation =
        CurvedAnimation(parent: scaleController, curve: Curves.linear);
    scaleController.repeat(
      min: 0,
      max: 1,
      period: const Duration(seconds: 2),
      reverse: true,
    );
  }

  void navigateToNextScreen() {
    Navigator.of(context).pushReplacementNamed(Routes.demo);
  }

  void startAnimation() async {
    rotateController.forward(from: 0.0);
    rotateController
        .reverse(from: 0.0)
        .whenComplete(() => navigateToNextScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RotationTransition(
        turns: rotateAnimation,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Center(
            child: Image.asset(UiUtils.getImagePath("splash.png")),
          ),
        ),
      ),
    );
  }
}
