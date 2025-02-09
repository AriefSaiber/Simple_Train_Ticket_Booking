import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<TextEditingController> originController = TextEditingController().obs;
  Rx<TextEditingController> departController = TextEditingController().obs;
  Rx<TextEditingController> returnController = TextEditingController().obs;
  Rx<TextEditingController> paxController = TextEditingController().obs;

  String? validator(String? value, String type) {
    if (value == null || value.isEmpty) {
      switch (type) {
        case 'origin':
          return 'Please enter you origin';
        case 'depart':
          return 'Please enter you depart';
          case 'return':
          return 'Please enter you return';
          case 'pax':
          return 'Please enter you pax';
        default:
          return null;
      }
    }
    return null;
  }
}