import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Admin/Vendors%20List/view_vendors.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:intl/intl.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Order/order_fetch.dart';


class AdminVendors extends StatefulWidget {
  static const String id = 'admin_vendors';
  @override
  _AdminVendorsState createState() => _AdminVendorsState();
}

class _AdminVendorsState extends State<AdminVendors> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Vendors',
          style: kAppBarTitleTextStyle,
        ),
      ),
      body: ViewVendors(),
    );
  }



}