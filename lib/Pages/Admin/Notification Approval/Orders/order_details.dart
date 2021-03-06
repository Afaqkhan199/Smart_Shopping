import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';




class OrderDetails extends StatefulWidget {
  OrderDetails({this.doc});
  DocumentSnapshot doc;
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  String getStatus()
  {
    return widget.doc.data()['status'];
  }
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
            "     Current Status: " + widget.doc.data()['status'],
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children:<Widget>[
              Text(
                "    New Status: ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
              flex: 1,
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              iconEnabledColor: Colors.deepOrangeAccent,
              iconSize: 30,
              items: _orderStatus.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(
                      () {
                    _orderSelectedStatus = newValue;
                  },
                );
              },
              value: _orderSelectedStatus,
            ),
              ),
          ],),
          RoundButton(title: 'Update Status', onPressed: (){
            widget.doc.reference.update({'status': _orderSelectedStatus});
            setState(() {
                // OrderDetails(doc:widget.doc);
            });
            final snackBar = SnackBar(content: Text('Status Updated'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

          },
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

var _orderStatus = ['Placed','Deployed','Delivered'];
var _orderSelectedStatus = 'Placed';