import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket_book/constants.dart';

class homeComp {
  textField() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your name',
        ),
      ),
    );
  }

  static Widget inputSet(BuildContext context, String text, Widget widget, {bool isMiddle = false}) {
    return Column(
      crossAxisAlignment: isMiddle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(text),
        SizedBox(
          height: Screen.H(context) * 0.007,
        ),
        widget,
      ],
    ).marginSymmetric(
      vertical: Screen.H(context) * 0.01,
    );
  }

  static submitButton(context, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: Screen.H(context) * 0.014),
        decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          'Submit',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
