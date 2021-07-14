import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Customer/customer_home.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Cart/show_cart.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'dart:math';

class cart extends StatefulWidget {
  static const String id = 'cart';
  @override
  _cartState createState() => _cartState();
}

void clearCart(){
  FirebaseFirestore.instance
      .collection('cart')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      if(doc.data()['customerEmail'] == getEmail())
        doc.reference.delete();
    });
  });
}

void getCustomerAddress(){
  FirebaseFirestore.instance
      .collection('users')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      if(doc.data()['email']==getEmail()){
        CustomerEmail = doc.data()['email'];
      }
    });
  });
}

List<String> productTitles = [];
List<String> productPrices = [];
List<String> vendorEmails = [];
String CustomerEmail = '';

void addTitlesandPrices(){
  for(int i=0;i<documents.length;i++){
    productTitles.add(documents[i].data()['title']);
    productPrices.add(documents[i].data()['price']);
    vendorEmails.add(documents[i].data()['vendorEmail']);
  }
}

String generateOrderID(){
  var rng = new Random();
  int rand = rng.nextInt(10000);
  return(rand.toString());
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
                          CollectionReference collectionReference = FirebaseFirestore.instance.collection('orders');
                          addTitlesandPrices();
                            Map<String,dynamic> itemDetails = {
                              "title" : productTitles,
                              "price" : productPrices,
                              "TotalPrice" : price1,
                              "vendorEmail" : vendorEmails,
                              "customerEmail" : getEmail(),
                              "OrderID" : generateOrderID(),
                              "OrderTime" : DateTime.now(),
                              "VendorAddress" : "Shop G13, F10, Islamabad",
                              "CustomerAddress" : CustomerEmail,
                              "status" : "Placed",
                              "NoOfItems" : documents.length.toString(),
                          };
                            collectionReference.add(itemDetails);


                          final snackBar = SnackBar(content: Text('Your order has been placed.'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          clearCart();
                          Navigator.of(context).pop();
                          setState(() {

                          });
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
