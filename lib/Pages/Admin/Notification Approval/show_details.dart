import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fyp_smart_shopping/Pages/Admin/Notification Approval/notification_details.dart';

class ShowDetails extends StatefulWidget {
  const ShowDetails({Key key}) : super(key: key);

  @override
  _ShowDetailsState createState() => _ShowDetailsState();
}

DocumentSnapshot product;

Map<String, dynamic> data;

class _ShowDetailsState extends State<ShowDetails> {
  FirebaseStorage _storage = FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    CollectionReference products =
    FirebaseFirestore.instance.collection('notifications');
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
              return inkwell(document, context);
          }).toList(),
        );
      },
    );
  }

  InkWell inkwell(DocumentSnapshot document, BuildContext context) {
    return InkWell(
      onTap: () {
        product = document;
        Navigator.pushNamed(context, NotificationDetails.id);
        data = document.data();
        //prodName = "${data['title']}";
        //Navigator.pop(context);
        //Navigator.pushNamed(context, notification.id);
      },
      child: new ListTile(
        leading: document.data()['imageURL'] == null
            ? Image.network(
            'https://firebasestorage.googleapis.com/v0/b/smartshopping-979f9.appspot.com/o/images%2FNo_Image_Available.jpg?alt=media&token=d109c767-611b-4cf4-a55f-4e0ad304f4c5')
            : Image.network(document.data()['imageURL']),
        title: new Text(document.data()['title']),
        subtitle: new Text(document.data()['NotificationText']),
      ),
    );
  }
}
