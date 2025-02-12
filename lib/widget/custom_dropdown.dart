import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:train_ticket_book/constants.dart';

class CustomDDown extends StatelessWidget {
  CustomDDown({required this.items, required this.onChanged, this.hint, this.initialItem, required this.validator});

  final String? hint;
  final String? Function(String?) validator;
  final String? initialItem;
  final List<String> items;
  final void Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>(
      validator: validator,
      decoration: CustomDropdownDecoration(
          closedErrorBorderRadius: BorderRadius.circular(10),
          expandedBorderRadius: BorderRadius.circular(10),
          closedBorder: Border.all(color: Constants.borderColor),
          expandedBorder: Border.all(color: Constants.borderColor),
          listItemStyle: TextStyle(color: Colors.black),
          headerStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(color: Colors.grey)),
      hintText: hint,
      initialItem: initialItem,
      items: items,
      onChanged: onChanged,
      excludeSelected: false,
    );
  }
}
