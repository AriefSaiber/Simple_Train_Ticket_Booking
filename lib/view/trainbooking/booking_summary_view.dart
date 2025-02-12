import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket_book/components/trainbooking/booking_summary_comp.dart';
import 'package:train_ticket_book/constants.dart';
import 'package:train_ticket_book/view/homepage_view.dart';
import 'package:train_ticket_book/view/payment_view.dart';
import 'package:train_ticket_book/widget/appbar.dart';

class BookingSummaryView extends StatelessWidget {
  const BookingSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Booking Summary',
        leadingCheck: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Center(
              child: Text(
            'Departure Detail',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          Divider(),
          summaryComp().textComp(title: 'Train Name', value: gCtrl.selectedDepartTrain.value, context),
          summaryComp().textComp(title: 'Origin Station', value: gCtrl.selectedOrigin.value, context),
          summaryComp().textComp(title: 'Destination Station', value: gCtrl.selectedDestination.value, context),
          summaryComp().textComp(title: 'Departure Time', value: gCtrl.selectedDepartTime.value, context),
          summaryComp()
              .textComp(title: 'Arrival Time', value: gCtrl.addHoursToTime(gCtrl.selectedDepartTime.value, 2), context),
          summaryComp().textComp(
              title: 'Departure Date', value: gCtrl.convertDateTimeToString(gCtrl.selectedDepartDate.value!), context),
          Divider(),
          Center(
              child: Text(
            'Returning Detail',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          Divider(),
          summaryComp().textComp(title: 'Train Name', value: gCtrl.selectedReturnTrain.value, context),
          summaryComp().textComp(title: 'Origin Station', value: gCtrl.selectedDestination.value, context),
          summaryComp().textComp(title: 'Destination Station', value: gCtrl.selectedOrigin.value, context),
          summaryComp().textComp(title: 'Departure Time', value: gCtrl.selectedReturnTime.value, context),
          summaryComp()
              .textComp(title: 'Arrival Time', value: gCtrl.addHoursToTime(gCtrl.selectedReturnTime.value, 2), context),
          summaryComp().textComp(
              title: 'Departure Date', value: gCtrl.convertDateTimeToString(gCtrl.selectedReturnDate.value!), context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              summaryComp().buttonWidget(context, color: Colors.grey, title: 'Go Back', onPressed: () {
                Get.back();
              }),
              summaryComp().buttonWidget(context, color: Constants.primaryColor, title: 'Proceed', onPressed: () {
                Get.to(() => PaymentMethod());
              }),
            ],
          ).marginSymmetric(vertical: Screen.H(context) * 0.02),
        ],
      ).marginSymmetric(
        horizontal: Screen.W(context) * 0.05,
        vertical: Screen.H(context) * 0.02,
      ),
    );
  }
}
