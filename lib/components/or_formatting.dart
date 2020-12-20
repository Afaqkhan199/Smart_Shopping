import 'package:flutter/material.dart';

class ORWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 163.0),
      child: Text(
        'OR',
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          // color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }
}
