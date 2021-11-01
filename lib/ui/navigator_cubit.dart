import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

enum NavState { splash, onboard, signin, signup, demo, loading }

class NavigatorCubit extends Cubit<NavState> {
  NavigatorCubit() : super(NavState.splash);

  void showSignin() => emit(NavState.signin);
  void showSignup() => emit(NavState.signup);
  void showSplash() => emit(NavState.splash);
  void showOnboard() => emit(NavState.onboard);
  void showDemo() => emit(NavState.demo);
  void showLoading() {
    log("Loading");
    emit(NavState.loading);
  }
}
