import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket_book/components/trainbooking/booking_summary_comp.dart';
import 'package:train_ticket_book/constants.dart';
import 'package:train_ticket_book/view/homepage_view.dart';
import 'package:train_ticket_book/widget/appbar.dart';

class BookingSummaryView extends StatelessWidget {
  const BookingSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Booking Summary',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          summaryComp().textComp(title: 'Train Name', value: gCtrl.selectedTrain.value, context),
          summaryComp().textComp(title: 'Origin Station', value: gCtrl.selectedTrain.value, context),
          summaryComp().textComp(title: 'Destination Station', value: gCtrl.selectedTrain.value, context),
          summaryComp().textComp(title: 'Departure Time', value: gCtrl.selectedTrain.value, context),
          summaryComp().textComp(title: 'Arrival Time', value: gCtrl.selectedTrain.value, context),
          summaryComp().textComp(title: 'Departure Date', value: gCtrl.selectedTrain.value, context),
          summaryComp().textComp(title: 'Arrival Date', value: gCtrl.selectedTrain.value, context),
        ],
      ).marginSymmetric(
        horizontal: Screen.W(context) * 0.05,
        vertical: Screen.H(context) * 0.05,
      ),
    );
  }
}
