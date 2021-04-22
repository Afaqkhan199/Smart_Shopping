import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference products= FirebaseFirestore.instance.collection('products');
    return StreamBuilder<QuerySnapshot>(
        stream: products.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError) {
          return Center(
            child: Text('Something went wrong'),
          );
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: Text('Loading'),
          );
        }
        return new ListView(
        children: snapshot.data.docs.map((DocumentSnapshot document){
    return new ListTile(
    title: new Text(document.data()['title']),
    subtitle: new Text(document.data()['price']),
    );
    }).toList(),
    );
     },
    );
  }
}
