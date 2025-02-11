import 'package:flutter/material.dart';
import 'package:train_ticket_book/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final bool leadingCheck;
  List<Widget>? actionButton;

  CustomAppBar(
      {Key? key,
      required this.title,
      this.titleColor = Colors.white,
      this.backgroundColor = Constants.primaryColor,
      this.leadingCheck = true,
      this.actionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backbuttonColor = Colors.black;
    if (titleColor == Colors.white) {
      backbuttonColor = Colors.white;
    }
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: titleColor),
      ),
      leading: leadingCheck
          ? BackButton(
              color: backbuttonColor,
            )
          : null,
      actions: actionButton,
      centerTitle: true,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: leadingCheck,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
