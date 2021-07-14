import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Search/Item%20Details/add_to_cart.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:fyp_smart_shopping/Pages/Customer/customer_home.dart';

CollectionReference cart = FirebaseFirestore.instance.collection('cart');

//Future<void> updateCart() {
 // return users
 //     .doc(getEmail())
//      .set({
//    'product_url': imgUrl,
 // })
 //     .then((value) => print("User Added"))
  //    .catchError((error) => print("Failed to add user: $error"));
//}

//String imgUrl;

class CustomerChargerDetails extends StatelessWidget {
  CustomerChargerDetails(this.doc);
  final DocumentSnapshot doc;

  @override
  Widget build(BuildContext context) {
    String getEmail() {
      User user = FirebaseAuth.instance.currentUser;
      return user.email.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(doc.data()['title'],
            style: kAppBarTitleTextStyle.copyWith(letterSpacing: 0)),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: doc.data()['imageURL'] == null
                ? Image.network(
                'https://firebasestorage.googleapis.com/v0/b/smartshopping-979f9.appspot.com/o/images%2FNo_Image_Available.jpg?alt=media&token=d109c767-611b-4cf4-a55f-4e0ad304f4c5')
                : Image.network(doc.data()['imageURL']),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "     Company: " + doc.data()['company'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "     Charging type: " + doc.data()['type'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "     Description: " + doc.data()['description'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "     Price: " + doc.data()['price'] + " pkr",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          RoundButton(
            title: "Add to Cart",
            onPressed: (){
              Map<String,dynamic> productData = {"title" : doc.data()['title'],
                "description" : doc.data()['description'],
                "type" : doc.data()['type'],
                "company" : doc.data()['company'],
                "price" : doc.data()['price'],
                "category" : "Charger",
                "vendorEmail" : doc.data()['vendorEmail'],
                "imageURL" : doc.data()['imageURL'],
                "customerEmail" : getEmail(),
              };
              cart.add(productData);
              Navigator.pop(context);
              final snackBar = SnackBar(content: Text('Product Added to Cart'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              // imgUrl = doc.data()['imageURL'];
             // updateCart();
              //AddToCart a1 = new AddToCart();
              //a1.imgUrl.add(doc.data()['imageURL']);
                //a1.addFirst();
                 },
          ),
        ],
      ),
    );
  }
}
