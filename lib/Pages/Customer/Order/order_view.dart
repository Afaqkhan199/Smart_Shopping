import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:intl/intl.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Order/order_fetch.dart';


class OrderView extends StatefulWidget {
  static const String id = 'order_view';
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.deepOrangeAccent,
      title: Text(
        'My Orders',
        style: kAppBarTitleTextStyle,
      ),
    ),
    body: FetchOrders(),
    );
  }



}