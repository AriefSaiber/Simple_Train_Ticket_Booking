import 'package:flutter/material.dart';

class Constants {
  static const Color primaryColor = Color(0xff000080);
  static const Color borderColor = Color.fromARGB(255, 185, 185, 185);

}

class Screen {
  static W(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static H(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}