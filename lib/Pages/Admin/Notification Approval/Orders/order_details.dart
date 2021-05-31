import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key key}) : super(key: key);
  static const String id = 'order_details';
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
