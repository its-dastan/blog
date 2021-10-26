import 'dart:math';
import 'package:blog/app/routes.dart';
import 'package:blog/ui/styles/text_styles.dart';
import 'package:blog/ui/widgets/onboarding_pages.dart';
import 'package:blog/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int page = 0;
  late LiquidController liquidController;
  late UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  Widget _buildDots(int index) {
    double selected = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selected;
    return SizedBox(
      width: 20,
      child: Center(
        child: Material(
          color: Colors.black,
          type: MaterialType.card,
          child: SizedBox(
            width: 6.0 * zoom,
            height: 6.0,
          ),
        ),
      ),
    );
  }

  final pages = [
    OnboardingPages(
      image: UiUtils.getImagePath("onBoarding1.png"),
      heading: "Dastan",
      description:
          "Stay informed with the fastest and most effectivwe way, wherever you are",
    ),
    OnboardingPages(
      image: UiUtils.getImagePath("onBoarding2.png"),
      heading: "Dastan1",
      description:
          "Stay informed with the fastest and most effectivwe way, wherever you are",
    ),
    OnboardingPages(
      image: UiUtils.getImagePath("onBoarding3.png"),
      heading: "Dastan2",
      description:
          "Stay informed with the fastest and most effectivwe way, wherever you are",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: pages,
            liquidController: liquidController,
            enableLoop: false,
            fullTransitionValue: 500,
            waveType: WaveType.liquidReveal,
            ignoreUserGestureWhileAnimating: true,
            onPageChangeCallback: pageChangeCallback,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(pages.length, _buildDots),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextButton(
                onPressed: page == (pages.length - 1)
                    ? () {
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.signin);
                      }
                    : () {
                        liquidController.jumpToPage(
                            page: liquidController.currentPage + 1);
                      },
                child: page == (pages.length - 1)
                    ? const Text(
                        "Start",
                        style: TextStyles.onBoardingButton,
                      )
                    : const Text(
                        "Next",
                        style: TextStyles.onBoardingButton,
                      ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: TextButton(
                onPressed: () {
                  liquidController.animateToPage(
                      page: pages.length - 1, duration: 200);
                },
                child: page == (pages.length - 1)
                    ? const Text("")
                    : const Text(
                        "Skip",
                        style: TextStyles.onBoardingButton,
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() => {page = lpage});
  }
}
