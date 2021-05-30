import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/led.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/charger.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/graphic_card.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/vendor_home.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Notifications/notification_page.dart';

class ShowProducts extends StatefulWidget {
  const ShowProducts({Key key}) : super(key: key);

  @override
  _ShowProductsState createState() => _ShowProductsState();
}

Map<String, dynamic> data;

class _ShowProductsState extends State<ShowProducts> {
  FirebaseStorage _storage = FirebaseStorage.instance;
  final String ve = VendorHome().getEmail();
  @override
  Widget build(BuildContext context) {
    CollectionReference products =
    FirebaseFirestore.instance.collection('products');
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
            if (document.data()['vendorEmail'] == ve) {
              return inkwell(document, context);
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

  InkWell inkwell(DocumentSnapshot document, BuildContext context) {
    return InkWell(
      onTap: () {
        data = document.data();
        prodName = "${data['title']}";
        Navigator.pop(context);
        //Navigator.pushNamed(context, notification.id);
      },
      child: new ListTile(
        leading: document.data()['imageURL'] == null
            ? Image.network(
            'https://firebasestorage.googleapis.com/v0/b/smartshopping-979f9.appspot.com/o/images%2FNo_Image_Available.jpg?alt=media&token=d109c767-611b-4cf4-a55f-4e0ad304f4c5')
            : Image.network(document.data()['imageURL']),
        title: new Text(document.data()['title']),
        subtitle: new Text(document.data()['price']),
      ),
    );
  }

  Future<void> deleteImage(String url, DocumentSnapshot d) async{
    var photo = _storage.refFromURL(url);
    await photo.delete();
  }

  void removeProduct(DocumentSnapshot d) {
    print(d.data()['title']);
    String imgFileURL = d["imageURL"];
    deleteImage(imgFileURL, d);
    d.reference.delete().then((value) => print("Product Deleted"))
        .catchError((error) => print("Failed to delete product: $error"));
  }
}
