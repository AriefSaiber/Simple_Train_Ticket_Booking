import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:train_ticket_book/components/homepage_comp.dart';
import 'package:train_ticket_book/controller/global_ctrl.dart';
import 'package:train_ticket_book/controller/homepage_ctrl.dart';
import 'package:train_ticket_book/model/homepage_mdl.dart';
import 'package:train_ticket_book/view/trainbooking/train_select_view.dart';
import 'package:train_ticket_book/widget/counter_widget.dart';
import 'package:train_ticket_book/widget/custom_dropdown.dart';
import 'package:train_ticket_book/widget/custom_textfield.dart';
import 'package:train_ticket_book/widget/custom_datedown.dart';

import '../constants.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

HomeController homeCtrl = Get.put(HomeController());
GlobalController gCtrl = Get.put(GlobalController());

class _HomepageState extends State<Homepage> {
  DateTime todayDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Train Ticket Booking'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Train Ticket Booking',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              homeComp.inputSet(
                context,
                'Enter Origin Station',
                CustomDDown(
                  items: homeModel().originList,
                  onChanged: (value) {
                    if (value != null) {
                      homeCtrl.selectedOrigin.value = value;
                    }
                  },
                  validator: (value) => homeCtrl.validator(value, 'origin'),
                ),
              ),
              homeComp.inputSet(
                context,
                'Enter Destination Station',
                CustomDDown(
                  items: homeModel().destinationList,
                  onChanged: (value) {
                    if (value != null) {
                      homeCtrl.selectedDestination.value = value;
                    }
                  },
                  validator: (value) => homeCtrl.validator(value, 'destination'),
                ),
              ),
              homeComp.inputSet(
                context,
                'Enter Depart Date',
                CustomDateDDown(
                  validator: (value) => homeCtrl.validator(value, 'depart'),
                  label: 'Depart Date',
                  dateinput: homeCtrl.departController.value,
                  selectedDate: homeCtrl.selectedStartDate,
                  onChanged: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: homeCtrl.selectedStartDate.value ?? todayDate,
                      firstDate: todayDate.subtract(Duration(days: 365)),
                      lastDate: todayDate.add(Duration(days: 0)),
                    );
                    if (pickedDate != null) {
                      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                      homeCtrl.selectedStartDate.value = pickedDate;
                      homeCtrl.departController.value.text = formattedDate;
                      homeCtrl.startDate = homeCtrl.formatDate(homeCtrl.selectedStartDate);
                    }
                  },
                ),
              ),
              homeComp.inputSet(
                context,
                'Enter Return Date',
                CustomDateDDown(
                  validator: (value) => homeCtrl.validator(value, 'return'),
                  label: 'Return Date',
                  dateinput: homeCtrl.returnController.value,
                  selectedDate: homeCtrl.selectedEndDate,
                  onChanged: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: homeCtrl.selectedEndDate.value ?? todayDate,
                      firstDate: todayDate.subtract(Duration(days: 365)),
                      lastDate: todayDate.add(Duration(days: 0)),
                    );
                    if (pickedDate != null) {
                      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                      homeCtrl.selectedEndDate.value = pickedDate;
                      homeCtrl.returnController.value.text = formattedDate;
                      homeCtrl.startDate = homeCtrl.formatDate(homeCtrl.selectedEndDate);
                    }
                  },
                ),
              ),
              homeComp.inputSet(
                  context,
                  'Enter Number of Passengers',
                  CounterWidget(
                    initialValue: 1,
                    min: 1,
                    max: 10,
                    onChanged: (value) {},
                  ),
                  isMiddle: true),
              homeComp.submitButton(context, () {
                Get.to(() => TrainSelect());
                if (_formKey.currentState!.validate()) {
                gCtrl.selectedOrigin.value = homeCtrl.selectedOrigin.value;
                gCtrl.selectedDestination.value = homeCtrl.selectedDestination.value;
                gCtrl.selectedStartDate.value = homeCtrl.selectedStartDate.value;
                gCtrl.selectedEndDate.value = homeCtrl.selectedEndDate.value;
                Get.to(() => TrainSelect());
                }
              }),
            ],
          ).marginSymmetric(horizontal: Screen.W(context) * 0.1),
        ),           
      ),
    );
  }
}
