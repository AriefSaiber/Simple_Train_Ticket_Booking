import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GlobalController extends GetxController {
  RxString selectedOrigin = ''.obs;
  RxString selectedDestination = ''.obs;
  Rx<DateTime?> selectedStartDate = Rx<DateTime?>(null);
  Rx<DateTime?> selectedEndDate = Rx<DateTime?>(null);

  RxString selectedTrain = ''.obs;

  String convertDateTimeToString(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy');
    return formatter.format(dateTime);
  }
}