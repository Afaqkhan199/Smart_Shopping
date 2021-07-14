import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Orders/vendor_vieworders.dart';
import 'package:fyp_smart_shopping/components/constants.dart';

class VendorOrders extends StatefulWidget {
  static const String id = 'vendor_orders';

  @override
  _VendorOrdersState createState() => _VendorOrdersState();
}

class _VendorOrdersState extends State<VendorOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Order History',
          style: kAppBarTitleTextStyle,
        ),
      ),
      body: VendorViewOrders(),
    );
  }
}
