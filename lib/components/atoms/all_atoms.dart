import 'package:flutter/material.dart';

TextField customTextField(
    {required TextEditingController controller,
    required Color cursorColor,
    required double cursorWidth,
    required Color textColor,
    required FontWeight fontWeight,
    required double fontSize,
    required String hint,
      required Color hintColor,
      TextInputType keyboardType = TextInputType.text,
    }) {
  return TextField(
    keyboardType: keyboardType,
    controller: controller,
    cursorColor: cursorColor,
    cursorWidth: cursorWidth,
    style:
        TextStyle(color: textColor, fontWeight: fontWeight, fontSize: fontSize),
    decoration: InputDecoration(hintText: hint, border: InputBorder.none,hintStyle: TextStyle(color: hintColor)),
  );
}
