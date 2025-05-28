import 'package:flutter/material.dart';

Widget textField(labeltext, icon, controller) {
  return TextFormField(
    controller: controller,
    obscureText: (labeltext == 'password') ? true : false,
    maxLength: (labeltext == 'email') ? 40 : 8,
    decoration: InputDecoration(
      icon: Icon(icon),
      labelText: labeltext,
      border: OutlineInputBorder(),
    ),
  );
}
