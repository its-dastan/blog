import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final bool? obscureText;
  final Function? validator;
  const TextFormFieldWidget(
      {Key? key, this.hintText, this.obscureText, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => null,
      obscureText: obscureText!,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
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
    );
  }
}
