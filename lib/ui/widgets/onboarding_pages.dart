import 'package:blog/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class OnboardingPages extends StatelessWidget {
  final String? image;
  final String? heading;
  final String? description;
  const OnboardingPages(
      {Key? key,
      @required this.image,
      @required this.heading,
      @required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(image!),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
          ),
          Text(
            heading!,
            style: TextStyles.onBoardingHeader,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            child: Text(
              description!,
              textAlign: TextAlign.center,
              style: TextStyles.onBoardingDescription,
            ),
          ),
        ],
      ),
    );
  }
}
