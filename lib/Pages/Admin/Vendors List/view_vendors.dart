import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/led.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/charger.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/graphic_card.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fyp_smart_shopping/Pages/Customer/customer_home.dart';


List<DocumentSnapshot> documents;


void addDocumentstoList(DocumentSnapshot document){
  documents.add(document);
}




class ViewVendors extends StatelessWidget {
  FirebaseStorage _storage = FirebaseStorage.instance;
  final String ve = getEmail();
  @override
  Widget build(BuildContext context) {
    documents = [];
    CollectionReference products =
    FirebaseFirestore.instance.collection('users');
    return StreamBuilder<QuerySnapshot>(
      stream: products.where('type', isEqualTo: 'Users.Vendor').snapshots(),
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
              documents.add(document);
              return buildTripCard(document, context);
            
          }).toList(),
        );
      },
    );
  }

  Widget buildTripCard(DocumentSnapshot snapshot, BuildContext context) {
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Row(children: <Widget>[
                  Text("Vendor Email: " + snapshot.data()['email']),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 40.0),
                child: Row(children: <Widget>[
                  Text("Vendor Name: " + snapshot.data()['name']),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text("Status: " + snapshot.data()['status']),
                    Spacer(),
                    Icon(Icons.beenhere_outlined),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
