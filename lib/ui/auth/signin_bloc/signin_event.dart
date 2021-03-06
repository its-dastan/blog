import 'package:blog/ui/auth/signin.dart';

abstract class SigninEvent {}

class SigninInitial extends SigninEvent {}

class SigninUsernameChanged extends SigninEvent {
  final String? username;

  SigninUsernameChanged({this.username});
}

class SigninPasswordChanged extends SigninEvent {
  final String? password;

  SigninPasswordChanged({this.password});
}

class SigninSubmitted extends SigninEvent {
  final String? username;
  final String? password;

  SigninSubmitted({this.username, this.password});
}
