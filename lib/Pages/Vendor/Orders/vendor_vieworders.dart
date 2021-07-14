import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Admin/Notification%20Approval/Orders/order_details.dart';
import 'package:fyp_smart_shopping/Pages/Customer/customer_home.dart';

List<DocumentSnapshot> documents;


void addDocumentstoList(DocumentSnapshot document){
  documents.add(document);
}



class VendorViewOrders extends StatelessWidget {
  FirebaseStorage _storage = FirebaseStorage.instance;
  final String ve = getEmail();
  @override
  Widget build(BuildContext context) {
    documents = [];
    CollectionReference products =
    FirebaseFirestore.instance.collection('orders');
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
            String vendEmail = document.data()['vendorEmail'];
            //documents.add(document);
            if(vendEmail == ve)
            return buildTripCard(document, context);
            else {
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

  Widget buildTripCard(DocumentSnapshot snapshot, BuildContext context) {
    return new Container(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderDetails(doc: snapshot),
              ),
            );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Row(children: <Widget>[
                      Text("Order ID: " + snapshot.data()['OrderID']),
                      Spacer(),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 40.0),
                    child: Row(children: <Widget>[
                      Text(snapshot.data()['NoOfItems'] + " Items"),
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
        )

    );
  }
}