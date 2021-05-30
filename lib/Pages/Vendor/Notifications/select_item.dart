import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/show_product.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Notifications/show_products.dart';

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
      body: ShowProducts(),
    );
  }
}
