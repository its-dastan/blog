import 'package:blog/app/routes.dart';
import 'package:blog/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 4010),
  )..addStatusListener(animationStatusListener);
  late AnimationController titleFadeAnimationController;

  late AnimationController logoAnimationController;
  late Animation<double> logoScaleUpAnimation;
  late Animation<double> logoScaleDownAnimation;

  void animationStatusListener(AnimationStatus animationStatus) {
    if (animationStatus == AnimationStatus.completed) {
      titleFadeAnimationController.forward(from: 0.0);
    }
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    logoAnimationController.dispose();
    super.dispose();
  }

  void initAnimation() {
    logoAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    logoScaleUpAnimation = Tween<double>(begin: 0.0, end: 1.1).animate(
        CurvedAnimation(
            parent: logoAnimationController,
            curve: const Interval(0.0, 0.4, curve: Curves.easeInOut)));
    logoScaleDownAnimation = Tween<double>(begin: 0.0, end: 0.1).animate(
        CurvedAnimation(
            parent: logoAnimationController,
            curve: const Interval(0.4, 1.0, curve: Curves.easeInOut)));
  }

  void navigateToNextScreen() {
    Navigator.of(context).pushReplacementNamed(Routes.demo);
  }

  void startAnimation() async {
    await logoAnimationController.forward(from: 0.0);
    navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    startAnimation();
    return Scaffold(
      body: AnimatedBuilder(
        animation: logoAnimationController,
        builder: (context, child) {
          double scale =
              logoScaleUpAnimation.value - logoScaleDownAnimation.value;
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: Center(
          child: Image.asset(UiUtils.getImagePath("splash.png")),
        ),
      ),
    );
  }
}
