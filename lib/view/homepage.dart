import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket_book/controller/homepage_ctrl.dart';
import 'package:train_ticket_book/model/homepage_mdl.dart';
import 'package:train_ticket_book/widget/custom_dropdown.dart';
import 'package:train_ticket_book/widget/custom_textfield.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

HomeController homeCtrl = Get.put(HomeController());

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Train Ticket Booking'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Train Ticket Booking'),
            Text('Enter Origin Station'),
            CustomDDown(items: homeModel().originList, onChanged: (value){}),
            Text('Enter Destination Station'),
            CustomDDown(items: homeModel().destinationList, onChanged: (value){}),
          ],
        ),
      ),
    ); 
  }
}