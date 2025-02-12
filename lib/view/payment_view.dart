import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket_book/model/payment_mdl.dart';
import 'package:train_ticket_book/view/complete_view.dart';
import 'package:train_ticket_book/widget/appbar.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment Method',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: List.generate(PaymentModel.paymentMethods.length, (index) {
            return Column(
              children: [
                ListTile(
                  title: Text(PaymentModel.paymentMethods[index]),
                  onTap: () {
                    Get.to(() => CompleteView());
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