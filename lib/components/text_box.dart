import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  TextBox({this.hnt});
  final String hnt;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hnt,
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
        ),
      ),
    );
  }
}