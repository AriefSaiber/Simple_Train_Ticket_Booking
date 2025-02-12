import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket_book/model/trainbooking/train_select_mdl.dart';
import 'package:train_ticket_book/view/homepage_view.dart';
import 'package:train_ticket_book/view/trainbooking/seat_select_depart_view.dart';
import 'package:train_ticket_book/view/trainbooking/seat_select_return_view.dart';
import 'package:train_ticket_book/widget/appbar.dart';

class TrainReturnSelect extends StatelessWidget {
  const TrainReturnSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Select Returning Train',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: List.generate(trainBookModel.trainList.length, (index) {
            return Column(
              children: [
                ListTile(
                  title: Text(trainBookModel.trainList[index]),
                  onTap: () {
                    gCtrl.selectedReturnTrain.value = trainBookModel.trainList[index];
                    Get.to(() => SeatReturnSelect());
                  },
                ),
                Divider()
              ],
            );
          }),
        ),
      ),
    );
  }
}
