import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket_book/constants.dart';

class summaryComp {
  Widget textComp(BuildContext context, {required String title, required String value}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${title}: ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    ).marginSymmetric(
      vertical: Screen.H(context) * 0.01,
    );
  }
}
