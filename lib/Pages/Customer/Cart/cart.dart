import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Cart/show_cart.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';

class cart extends StatefulWidget {
  static const String id = 'cart';
  @override
  _cartState createState() => _cartState();
}


class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Cart',
          style: kAppBarTitleTextStyle,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: CartProducts()),
          Text("Total Bill: " + price1.toString() + " PKR"),
          Align(
            alignment: Alignment.bottomCenter,
            child: RoundButton(
              title: "Request Delivery",
              onPressed: (){
                print(documents.length);
                showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                    title: Text("Request Delivery"),
                    content: Text('Do you want to request delivery for the items in your cart?'),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {

                          final snackBar = SnackBar(content: Text('Your order has been placed.'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.of(context).pop();
                        },
                        child: Text('Yes'),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No'),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      )
    );
  }
}
