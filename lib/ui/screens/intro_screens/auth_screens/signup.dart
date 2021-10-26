import 'dart:developer';

import 'package:blog/app/routes.dart';
import 'package:blog/ui/styles/text_styles.dart';
import 'package:blog/ui/widgets/auth_button.dart';
import 'package:blog/ui/widgets/faded_animation.dart';
import 'package:blog/ui/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
      child: Column(
        children: [
          const TextFormFieldWidget(
            hintText: "Name",
            obscureText: false,
          ),
          const SizedBox(
            height: 7.5,
          ),
          const TextFormFieldWidget(
            hintText: "E-mail or User-Id",
            obscureText: false,
          ),
          const SizedBox(
            height: 7.5,
          ),
          const TextFormFieldWidget(
            hintText: "Password",
            obscureText: true,
          ),
          const SizedBox(
            height: 7.5,
          ),
          const TextFormFieldWidget(
            hintText: "Confirm Password",
            obscureText: true,
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              log("Signup Clicked");
            },
            child: const AuthButton(
              text: "Signup",
            ),
          ),
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
                  Navigator.of(context).pop();
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
}
