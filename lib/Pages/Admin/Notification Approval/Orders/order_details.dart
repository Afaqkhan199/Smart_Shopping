import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({this.doc});
  final DocumentSnapshot doc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Order Details',
          style: kAppBarTitleTextStyle,
        ),
      ),
    );
  }
}
