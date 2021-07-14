import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';




class OrderDetails2 extends StatefulWidget {
  OrderDetails2({this.doc});
  DocumentSnapshot doc;
  @override
  _OrderDetails2State createState() => _OrderDetails2State();
}

class _OrderDetails2State extends State<OrderDetails2> {
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
        body: ListView(children: <Widget>[
          SizedBox(height: 30,),
          Text(
            "     Order ID: " + widget.doc.data()['OrderID'],
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "     No. of Items: " + widget.doc.data()['NoOfItems'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          // Text(
          //   "     Title: " + doc.data()['title'],
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontSize: 16,
          //   ),
          // ),
          // SizedBox(
          //   height: 16,
          // ),
          // Text(
          //   "     Price: " + doc.data()['price'],
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontSize: 16,
          //   ),
          // ),
          // SizedBox(
          //   height: 16,
          // ),
          // Text(
          //   "     Vendor Email: " + doc.data()['vendorEmail'],
          //   style: TextStyle(
          //     color: Colors.red,
          //     fontWeight: FontWeight.bold,
          //     fontSize: 16,
          //   ),
          // ),
          // SizedBox(
          //   height: 16,
          // ),
          Text(
            "     Vendor Address: " + widget.doc.data()['VendorAddress'],
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "     Customer Email: " + widget.doc.data()['customerEmail'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "     Customer Address: " + widget.doc.data()['CustomerAddress'],
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "     Status: " + widget.doc.data()['status'],
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),

          // Text(
          //   "     Order Time: " + (doc.data()['OrderTime'].toString()),
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontSize: 16,
          //   ),
          // ),
          // SizedBox(
          //   height: 16,
          // ),
          // Text(
          //   "     Total Price: " + doc.data()['Total Price'],
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontSize: 16,
          //   ),
          // ),
          // SizedBox(
          //   height: 16,
          // ),
          //   ],
          // ),
        ]));
  }
}
