import 'package:flutter/material.dart';

class homeComp{


textField(){
  return Container(
    padding: EdgeInsets.all(10),
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter your name',
      ),
    ),
  );
}
}