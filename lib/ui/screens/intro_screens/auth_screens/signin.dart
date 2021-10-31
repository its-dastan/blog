import 'dart:developer';

import 'package:blog/app/routes.dart';
import 'package:blog/bloc/auth_bloc/form_submission_status.dart';
import 'package:blog/bloc/auth_bloc/signin_bloc/signin_bloc.dart';
import 'package:blog/bloc/auth_bloc/signin_bloc/signin_event.dart';
import 'package:blog/bloc/auth_bloc/signin_bloc/signin_state.dart';
import 'package:blog/ui/styles/text_styles.dart';
import 'package:blog/ui/widgets/auth_button.dart';
import 'package:blog/ui/widgets/faded_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  width: 80,
                  height: 200,
                  child: FadeAnimation(
                    1.5,
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/light-1.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 140,
                  width: 80,
                  height: 150,
                  child: FadeAnimation(
                    1.7,
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/light-2.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 40,
                  width: 80,
                  height: 150,
                  child: FadeAnimation(
                    1.9,
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/clock.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: FadeAnimation(
                    2.1,
                    Container(
                      margin: const EdgeInsets.all(50),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: FadeAnimation(
                2.3,
                _form(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _form() {
    return BlocListener<SigninBloc, SigninState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            _emailField(),
            const SizedBox(
              height: 7.5,
            ),
            _passwordField(),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot the password?",
                style: TextStyles.urlText,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            _signinButton(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.signup);
                  },
                  child: const Text(
                    " Signup!",
                    style: TextStyles.urlText,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return BlocBuilder<SigninBloc, SigninState>(builder: (context, state) {
      return TextFormField(
        obscureText: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "E-mail or User-Id",
          hintStyle: TextStyle(color: Colors.grey[400]),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: (value) =>
            state.isValidUsername ? null : "Username is too Short",
        onChanged: (value) => context
            .read<SigninBloc>()
            .add(SigninUsernameChanged(username: value)),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<SigninBloc, SigninState>(builder: (context, state) {
      return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.grey[400]),
          focusedBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: (value) =>
            state.isValidPassword ? null : "Password is too short.",
        onChanged: (value) => context
            .read<SigninBloc>()
            .add(SigninPasswordChanged(password: value)),
      );
    });
  }

  Widget _signinButton() {
    return BlocBuilder<SigninBloc, SigninState>(builder: (context, state) {
      return (state.formStatus is FormSubmitting)
          ? const CircularProgressIndicator()
          : GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  context.read<SigninBloc>().add(SigninSubmitted());
                }
                Navigator.pushReplacementNamed(context, Routes.demo);
              },
              child: const AuthButton(
                text: "Signin",
              ),
            );
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
