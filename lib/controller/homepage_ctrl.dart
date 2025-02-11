import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  Rx<TextEditingController> departController = TextEditingController().obs;
  Rx<TextEditingController> returnController = TextEditingController().obs;
  Rx<TextEditingController> paxController = TextEditingController().obs;

  RxString selectedOrigin = ''.obs;
  RxString selectedDestination = ''.obs;
  Rx<DateTime?> selectedStartDate = Rx<DateTime?>(null);
  Rx<DateTime?> selectedEndDate = Rx<DateTime?>(null);

  String startDate = '';

  String? validator(String? value, String type) {
    if (value == null || value.isEmpty) {
      switch (type) {
        case 'origin':
          return 'Please enter your origin';
        case 'destination':
          return 'Please enter your destination';
        case 'depart':
          return 'Please enter your depart';
        case 'return':
          return 'Please enter your return';
        default:
          return null;
      }
    }
    return null;
  }

  String formatDate(Rx<DateTime?> dateTime) {
    DateTime? date = dateTime.value;
    if (date == null) {
      return '';
    }

    // Format the DateTime object to display only the date part
    String formattedDate = DateFormat('dd-MM-yyyy').format(date);
    return formattedDate;
  }
}
