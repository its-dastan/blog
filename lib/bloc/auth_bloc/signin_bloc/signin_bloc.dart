import 'package:blog/bloc/auth_bloc/form_submission_status.dart';
import 'package:blog/bloc/auth_bloc/signin_bloc/signin_event.dart';
import 'package:blog/bloc/auth_bloc/signin_bloc/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc(SigninState initialState) : super(initialState);

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    // Username Updated
    if (event is SigninUsernameChanged) {
      yield state.copyWith(username: event.username);

      // Password Updated
    } else if (event is SigninPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form Submitted
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());
    }
  }
}
