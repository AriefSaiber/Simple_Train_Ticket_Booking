import 'package:flutter/material.dart';
import 'package:train_ticket_book/model/trainbooking/train_select_mdl.dart';
import 'package:train_ticket_book/widget/appbar.dart';

class TrainSelect extends StatelessWidget {
  const TrainSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Select Train',
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
