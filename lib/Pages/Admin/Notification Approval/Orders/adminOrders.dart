import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Admin/Notification%20Approval/Orders/adminViewOrders.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:intl/intl.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Order/order_fetch.dart';


class AdminOrders extends StatefulWidget {
  static const String id = 'admin_orders';
  @override
  _AdminOrdersState createState() => _AdminOrdersState();
}

class _AdminOrdersState extends State<AdminOrders> {

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
      body: AdminViewOrders(),
    );
  }



}