import 'dart:developer';

import 'package:blog/app/routes.dart';
import 'package:blog/ui/navigator_cubit.dart';
import 'package:blog/ui/auth/form_submission_status.dart';
import 'package:blog/ui/auth/signup_bloc/signup_bloc.dart';
import 'package:blog/ui/auth/signup_bloc/signup_event.dart';
import 'package:blog/ui/auth/signup_bloc/signup_state.dart';
import 'package:blog/ui/styles/text_styles.dart';
import 'package:blog/ui/auth/widgets/auth_button.dart';
import 'package:blog/ui/auth/widgets/faded_animation.dart';
import 'package:blog/ui/auth/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
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
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill,
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
                          "Signup",
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              return TextFormFieldWidget(
                  hintText: "Name",
                  obscureText: false,
                  validator: (value) =>
                      state.isValidName ? null : "name is too short",
                  onChanged: (value) {
                    log(value);
                    context
                        .read<SignupBloc>()
                        .add(SignupNameChanged(name: value));
                  });
            },
          ),
          const SizedBox(
            height: 7.5,
          ),
          BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              return TextFormFieldWidget(
                hintText: "Username",
                obscureText: false,
                validator: (value) =>
                    state.isValidUsername ? null : "Username is too short",
                onChanged: (value) => context
                    .read<SignupBloc>()
                    .add(SignupUsernameChanged(username: value)),
              );
            },
          ),
          const SizedBox(
            height: 7.5,
          ),
          BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              return TextFormFieldWidget(
                hintText: "Password",
                obscureText: true,
                validator: (value) =>
                    state.isValidPassword ? null : "Password is too short",
                onChanged: (value) => context
                    .read<SignupBloc>()
                    .add(SignupPasswordChanged(password: value)),
              );
            },
          ),
          const SizedBox(
            height: 7.5,
          ),
          BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              return TextFormFieldWidget(
                hintText: "Confirm Password",
                obscureText: true,
                validator: (value) =>
                    state.isConfirmPassword ? null : "Password does not match",
                onChanged: (value) => context.read<SignupBloc>().add(
                      SignupConfirmPasswordChanged(confirmPassword: value),
                    ),
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          _signupButton(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account?",
              ),
              InkWell(
                onTap: () {
                  return context.read<NavigatorCubit>().showSignin();
                },
                child: const Text(
                  " Signin!",
                  style: TextStyles.urlText,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _signupButton() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return (state.formStatus is FormSubmitting)
          ? const CircularProgressIndicator()
          : GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  context.read<SignupBloc>().add(SignupSubmitted());
                }
                // Navigator.pushReplacementNamed(context, Routes.demo);
              },
              child: const AuthButton(
                text: "Signup",
              ),
            );
    });
  }
}
