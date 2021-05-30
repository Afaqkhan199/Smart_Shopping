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
          Align(
            alignment: Alignment.bottomCenter,
            child: RoundButton(
              title: "Request Delivery",
              onPressed: (){
                print("ok");
              },
            ),
          )
        ],
      )
    );
  }
}
