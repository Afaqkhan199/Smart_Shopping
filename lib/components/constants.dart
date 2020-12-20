import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 20.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(30.0))),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);

const kAppBarTitleTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w600,
  letterSpacing: 2.0,
);
const kFormTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
