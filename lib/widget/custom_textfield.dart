import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:train_ticket_book/constant.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final Rx<TextEditingController> controller;
  final String? Function(String?) validator;
  final bool obscureText;
  final bool isEmail; // New parameter for email input
  final bool isNumber;
  final bool isReadOnly;
  final Color textColor;
  final Function(String)? onChanged;

  CustomTextFormField({
    Key? key,
    required this.label,
    required this.controller,
    required this.validator,
    this.obscureText = false,
    this.isEmail = false, // Default is false
    this.isNumber = false,
    this.isReadOnly = false,
    this.textColor = Colors.black,
    this.onChanged = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RxBool _obscureText = obscureText.obs;

    return Obx(
      () => TextFormField(
        controller: controller.value,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.grey, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Constants.primaryColor, width: 2),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          labelStyle: TextStyle(color: Colors.grey[700]),
          hintStyle: TextStyle(color: Colors.grey[500]),
          labelText: label,
          hintText: isEmail ? "example@mail.com" : null, // Display hint for email
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          suffixIcon: obscureText
              ? IconButton(
                  icon: Icon(
                    _obscureText.value ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _obscureText.toggle();
                  },
                )
              : null,
        ),
        style: TextStyle(color: textColor),
        readOnly: isReadOnly,
        obscureText: obscureText ? _obscureText.value : false,
        inputFormatters: [
          if (isNumber) FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
        ],
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : isNumber
                ? TextInputType.number
                : TextInputType.text, // Email-specific and number-specific keyboards
        validator: (value) {
          if (isEmail) {
            // Email validation logic
            final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
            if (value == null || value.isEmpty) {
              return 'Please enter an email address';
            }
            if (!emailRegex.hasMatch(value)) {
              return 'Please enter a valid email address';
            }
          }
          return validator(value); // Use the external validator for other cases
        },
        onChanged: onChanged,
      ),
    );
  }
}
