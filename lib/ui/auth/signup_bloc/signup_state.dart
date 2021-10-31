import 'package:blog/ui/auth/form_submission_status.dart';

class SignupState {
  final String? name;
  bool get isValidName => name!.length > 3;

  final String? username;
  bool get isValidUsername => username!.length > 3;

  final String? password;
  bool get isValidPassword => password!.length > 3;

  final String? confirmPassword;
  bool get isConfirmPassword => confirmPassword == password;
  final FormSubmissionStatus formStatus;

  SignupState({
    this.name = '',
    this.confirmPassword = '',
    this.username = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  SignupState copyWith({
    String? name,
    String? username,
    String? password,
    String? confirmPassword,
    FormSubmissionStatus? formStatus,
  }) {
    return SignupState(
      name: name ?? this.name,
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
