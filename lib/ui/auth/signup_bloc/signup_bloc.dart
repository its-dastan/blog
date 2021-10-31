import 'dart:developer';

import 'package:blog/ui/auth/form_submission_status.dart';
import 'package:blog/ui/auth/auth_repositories.dart';
import 'package:blog/ui/auth/signup_bloc/signup_event.dart';
import 'package:blog/ui/auth/signup_bloc/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository? authRepo;
  SignupBloc({this.authRepo}) : super(SignupState());

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    /// Name updated
    if (event is SignupNameChanged) {
      yield state.copyWith(name: event.name);

      // Username Updated
    } else if (event is SignupUsernameChanged) {
      yield state.copyWith(username: event.username);

      // Password Updated
    } else if (event is SignupPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Confirm Password changed
    } else if (event is SignupConfirmPasswordChanged) {
      yield state.copyWith(confirmPassword: event.confirmPassword);

      // Form Submitted
    } else if (event is SignupSubmitted) {
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
