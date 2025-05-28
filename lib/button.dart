import 'package:flutter/material.dart';

Widget button(text, onpressed) {
  return Builder(
    builder: (context) {
      return ElevatedButton(
        child: Text(text, style: TextStyle(color: Colors.white)),
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF009688),
        ),
      );
    },
  );
}
