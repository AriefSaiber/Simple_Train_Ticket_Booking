import 'package:flutter/material.dart';
import 'package:get/get.dart';

DateTime? _lastToastTime;
const Duration _minimumInterval = Duration(seconds: 4);
showSnackbar({
  String? title,
  required String message,
  bool isError = false,
}) {
  final now = DateTime.now();
  if (_lastToastTime == null || now.difference(_lastToastTime!) > _minimumInterval) {
    return Get.snackbar(
      title ?? '',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor:
          isError ? Color.fromARGB(255, 255, 213, 193) : Color.fromARGB(255, 210, 230, 212),
      colorText: isError ? Color.fromARGB(255, 109, 14, 17) : Color.fromARGB(255, 39, 56, 41),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      icon: isError
          ? Icon(Icons.error_outline, color: Colors.red[200])
          : const Icon(Icons.check_circle_rounded, color: Color(0xff44DB6B)),
      shouldIconPulse: true,
      barBlur: 15,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOut,
      reverseAnimationCurve: Curves.easeIn,
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      boxShadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}
