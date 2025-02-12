import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:train_ticket_book/constants.dart';

class CustomDateDDown extends StatelessWidget {
  CustomDateDDown({
    super.key,
    this.label = "Enter Date",
    required this.dateinput,
    Rx<DateTime?>? selectedDate,
    required this.onChanged,
    required this.validator,
  }) : _selectedDate = selectedDate ?? Rx<DateTime?>(DateTime.now());

  final String label;
  final String? Function(String?) validator;
  final TextEditingController dateinput;
  final Rx<DateTime?> _selectedDate;
  final void Function()? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: dateinput,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.black,
        hintStyle: TextStyle(color: Colors.grey),
        hintText: label,
        // labelText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Constants.borderColor, width: 1.5), // Border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Constants.borderColor, width: 1.5), // Border color
        ),
      ),
      readOnly: true,
      onTap: onChanged,
    );
  }
}
