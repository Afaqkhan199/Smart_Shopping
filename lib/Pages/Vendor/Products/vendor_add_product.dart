import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';

class VendorAddProduct extends StatelessWidget {
  static const String id = 'vendor_add_product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Add Product',
          style: kAppBarTitleTextStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: ListView(
          children: <Widget>[
            Text('Add product form goes here'),
          ],
        ),
      ),
    );
  }
}
