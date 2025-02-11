import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket_book/constants.dart';
import 'package:train_ticket_book/model/trainbooking/seat_select_mdl.dart';
import 'package:train_ticket_book/view/trainbooking/seat_select_depart_view.dart';
import 'package:train_ticket_book/widget/snackbar.dart';

class seatComp {
  Widget bookingContainer({required VoidCallback setState, required int pageindex}) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                'Window',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                'Window',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (seatCtrl.selectedSeat.value == '') {
                    seatCtrl.selectedSeat.value = "${seatCtrl.intToAlphabet(pageindex + 1)}${index + 1}";
                  } else if (seatCtrl.selectedSeat.value == "${seatCtrl.intToAlphabet(pageindex + 1)}${index + 1}") {
                    seatCtrl.selectedSeat.value = '';
                  } else {
                    showSnackbar(title: 'Sorry', message: 'You can only select one seat at a time', isError: true);
                  }
                  setState();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: "${seatCtrl.intToAlphabet(pageindex + 1)}${index + 1}" == seatCtrl.selectedSeat.value
                        ? Colors.green
                        : Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "${seatCtrl.intToAlphabet(pageindex + 1)}${index + 1}",
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ).marginSymmetric(horizontal: 20),
        ],
      ),
    );
  }

  Container timeContainer(BuildContext context, int index) {
    return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: Screen.W(context) * 0.2,
                    height: Screen.H(context) * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${seatMdl.times[index]}",
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 18,
                      ),
                    ),
                  );
  }
}
