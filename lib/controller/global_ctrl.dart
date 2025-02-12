import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GlobalController extends GetxController {
  RxString selectedOrigin = ''.obs;
  RxString selectedDestination = ''.obs;
  Rx<DateTime?> selectedDepartDate = Rx<DateTime?>(null);
  Rx<DateTime?> selectedReturnDate = Rx<DateTime?>(null);

  RxString selectedDepartTrain = ''.obs;
  RxString selectedReturnTrain = ''.obs;

  RxString selectedDepartTime = ''.obs;
  RxString selectedReturnTime = ''.obs;

  RxString selectedDepartSeat = ''.obs;
  RxString selectedReturnSeat = ''.obs;

  String convertDateTimeToString(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy');
    return formatter.format(dateTime);
  }

  String addHoursToTime(String time, int hoursToAdd) {
    DateFormat format = DateFormat("hh:mm a");
    DateTime dateTime = format.parse(time);

    dateTime = dateTime.add(Duration(hours: hoursToAdd));

    return format.format(dateTime);
  }
}
