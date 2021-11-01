import 'package:blog/ui/navigator_cubit.dart';
import 'package:blog/ui/auth/signin.dart';
import 'package:blog/ui/auth/signup.dart';
import 'package:blog/ui/screens/demo.dart';
import 'package:blog/ui/screens/loading_screen.dart';
import 'package:blog/ui/screens/onboarding_screen.dart';
import 'package:blog/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavigator extends StatelessWidget {
  const CustomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigatorCubit, NavState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state == NavState.loading)
            const MaterialPage(
              child: LoadingScreen(),
            ),
          if (state == NavState.splash)
            const MaterialPage(
              child: SplashScreen(),
            ),
          if (state == NavState.onboard)
            const MaterialPage(
              child: OnboardingScreen(),
            ),
          if (state == NavState.signin)
            const MaterialPage(
              child: Signin(),
            ),
          if (state == NavState.signup)
            const MaterialPage(
              child: SignUp(),
            ),
          if (state == NavState.demo)
            const MaterialPage(
              child: Demo(),
            ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
