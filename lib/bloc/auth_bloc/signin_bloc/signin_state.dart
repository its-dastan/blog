import 'package:blog/bloc/auth_bloc/form_submission_status.dart';

class SigninState {
  final String? username;
  final String? password;
  final FormSubmissionStatus formStatus;

  SigninState({
    this.username = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  SigninState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return SigninState(
        username: username ?? this.username,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }
}
