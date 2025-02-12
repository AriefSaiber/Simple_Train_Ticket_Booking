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

  Container buttonWidget(BuildContext context,
      {required String title, required Color color, required Function() onPressed}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(color),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
