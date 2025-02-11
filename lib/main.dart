import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket_book/view/homepage_view.dart';

void main() {
  runApp(TrainBooking());
}

class TrainBooking extends StatelessWidget {
  final routes = [
    GetPage(name: '/', page: () => Homepage()),
    GetPage(name: '/trainselect', page: () => Homepage()),
  ];
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Train Booking',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: Homepage(),
    );
  }
}
