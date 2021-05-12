import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';

class SelectItem extends StatefulWidget {
  static const String id = 'select_item';
  @override
  _SelectItemState createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(
            'Select Product',
            style: kAppBarTitleTextStyle,
          ),
        ),
    );
  }
}
