import 'dart:developer';

import 'package:blog/bloc/auth_bloc/form_submission_status.dart';
import 'package:blog/bloc/auth_bloc/signin_bloc/signin_event.dart';
import 'package:blog/bloc/auth_bloc/signin_bloc/signin_state.dart';
import 'package:blog/repositories_and_models/repositories/auth_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthRepository? authRepo;
  SigninBloc({this.authRepo}) : super(SigninState());

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    // Username Updated
    if (event is SigninUsernameChanged) {
      yield state.copyWith(username: event.username);

      // Password Updated
    } else if (event is SigninPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form Submitted
    } else if (event is SigninSubmitted) {
      log("Hello");
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo?.signin();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } on Exception catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
