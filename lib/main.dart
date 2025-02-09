import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_ticket_book/view/homepage.dart';

void main() {
  runApp(TrainBooking());
}

class TrainBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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