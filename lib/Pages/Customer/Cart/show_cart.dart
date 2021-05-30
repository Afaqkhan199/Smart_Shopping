import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/led.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/charger.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/graphic_card.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/update_product.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/vendor_home.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fyp_smart_shopping/Pages/Customer/customer_home.dart';

class CartProducts extends StatelessWidget {
  FirebaseStorage _storage = FirebaseStorage.instance;
  final String ve = getEmail();
  @override
  Widget build(BuildContext context) {
    CollectionReference products =
    FirebaseFirestore.instance.collection('cart');
    return StreamBuilder<QuerySnapshot>(
      stream: products.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Something went wrong'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('Loading'),
          );
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            if (document.data()['customerEmail'] == ve) {
              return tile(document, context);
            } else {
              return Container(
                height: 0,
                child: Text(''),
              );
            }
          }).toList(),
        );
      },
    );
  }

  ListTile tile(DocumentSnapshot document, BuildContext context) {
    return ListTile(
      onTap: () {
        if (document.data()['category'] == 'Charger')
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChargerDetails(document),
            ),
          );
        else if (document.data()['category'] == 'Graphics Card')
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CardDetails(document),
            ),
          );
        else if (document.data()['category'] == 'LED')
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LedDetails(document),
            ),
          );
        else
          print('No such category');
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (_) => new AlertDialog(
            title: Text(document.data()['title']),
            content: Text('Do you want to remove this product?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  removeProduct(document);
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
      trailing: IconButton(
        icon: new Icon(Icons.cancel_outlined),
        onPressed: () {
          removeProduct(document);
        },
      ),
      leading: document.data()['imageURL'] == null
          ? Image.network(
          'https://firebasestorage.googleapis.com/v0/b/smartshopping-979f9.appspot.com/o/images%2FNo_Image_Available.jpg?alt=media&token=d109c767-611b-4cf4-a55f-4e0ad304f4c5')
          : Image.network(document.data()['imageURL']),
      title: new Text(document.data()['title']),
      subtitle: new Text(document.data()['price']),
    );
  }

  Future<void> deleteImage(String url, DocumentSnapshot d) async {
    var photo = _storage.refFromURL(url);
    await photo.delete();
  }

  void removeProduct(DocumentSnapshot d) {
    String imgFileURL = d["imageURL"];
    deleteImage(imgFileURL, d);
    d.reference
        .delete()
        .then((value) => print("Product Deleted"))
        .catchError((error) => print("Failed to delete product: $error"));
  }
}
