import 'dart:developer';

import 'package:blog/app/routes.dart';
import 'package:blog/ui/styles/text_styles.dart';
import 'package:blog/ui/widgets/auth_button.dart';
import 'package:blog/ui/widgets/faded_animation.dart';
import 'package:blog/ui/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
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
    return Form(
      child: Column(
        children: [
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
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.demo);
            },
            child: const AuthButton(
              text: "Signin",
            ),
          ),
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
    );
  }
}
