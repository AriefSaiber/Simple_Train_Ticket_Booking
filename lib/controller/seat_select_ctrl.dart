import 'package:get/get.dart';

class SeatSelectController extends GetxController {
  RxString selectedSeat = ''.obs;

String intToAlphabet(int number) {
    if (number < 1 || number > 26) return "";
    return String.fromCharCode(64 + number);
  }
}