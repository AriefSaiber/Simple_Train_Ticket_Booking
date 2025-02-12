import 'package:get/get.dart';

class SeatSelectController extends GetxController {
  RxString selectedDepartSeat = ''.obs;
  RxString selectedReturnSeat = ''.obs;

  RxInt selectedDepartIndex = (0).obs;
  RxInt selectedReturnIndex = (0).obs;

  RxString selectedDepartTime = ''.obs;
  RxString selectedReturnTime = ''.obs;

  String intToAlphabet(int number) {
    if (number < 1 || number > 26) return "";
    return String.fromCharCode(64 + number);
  }
}
