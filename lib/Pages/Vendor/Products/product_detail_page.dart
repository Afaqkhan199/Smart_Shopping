import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/text_area.dart';

class ProductDetailPage extends StatelessWidget {
  // static const String id="product_detail_page";
  ProductDetailPage(this.doc);
  final DocumentSnapshot doc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details", style: kAppBarTitleTextStyle),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Image.asset('images/led.jpg')//doc.data()['imgURL']!=null ? Image.network(doc.data()['imgURL']): Text('No image'),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "    TCL 32 inch Smart LED",
            style: TextStyle(
            fontWeight: FontWeight.bold,
              fontSize: 20,
          ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "     -Android",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "     -720p resolution",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "     -32 inch screen",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "     -32000pkr",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
