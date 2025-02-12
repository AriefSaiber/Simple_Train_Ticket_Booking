import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket_book/model/trainbooking/train_select_mdl.dart';
import 'package:train_ticket_book/view/homepage_view.dart';
import 'package:train_ticket_book/view/trainbooking/seat_select_depart_view.dart';
import 'package:train_ticket_book/widget/appbar.dart';

class TrainDepartSelect extends StatelessWidget {
  const TrainDepartSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Select Departing Train',
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
                    gCtrl.selectedDepartTrain.value = trainBookModel.trainList[index];
                    Get.to(() => SeatDepartSelect());
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
