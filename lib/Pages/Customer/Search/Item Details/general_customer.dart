import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Customer/customer_home.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:fyp_smart_shopping/components/text_area.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Search/Item Details/add_to_cart.dart';

class CustomerGeneralDetails extends StatelessWidget {
  CustomerGeneralDetails(this.doc);
  final DocumentSnapshot doc;

  @override
  Widget build(BuildContext context) {
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
          RoundButton(
            title: "Add to Cart",
            onPressed: () {
              CollectionReference cart =
                  FirebaseFirestore.instance.collection('cart');
              Map<String, dynamic> productData = {
                "title": doc.data()['title'],
                "description": doc.data()['description'],
                "category": "LED",
                "price": doc.data()['price'],
                "vendorEmail": doc.data()['vendorEmail'],
                "imageURL": doc.data()['imageURL'],
                "customerEmail": getEmail(),
              };
              cart.add(productData);
              Navigator.pop(context);
              final snackBar = SnackBar(content: Text('Product Added to Cart'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              //AddToCart a1 = new AddToCart();
              //a1.imgUrl.add(doc.data()['imageURL']);
              //a1.addFirst();
            },
          )
        ],
      ),
    );
  }
}
