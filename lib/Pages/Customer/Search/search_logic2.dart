import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/led.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/charger.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/graphic_card.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Search/customer_search_led.dart';
import 'package:fyp_smart_shopping/Pages/Customer/customer_home.dart';

class SearchTest extends StatefulWidget {
  const SearchTest({Key key}) : super(key: key);

  @override
  _SearchTestState createState() => _SearchTestState();
}

class _SearchTestState extends State<SearchTest> {
  FirebaseStorage _storage = FirebaseStorage.instance;
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: products
          .where('keywords', arrayContainsAny: SearchKeywords)
          .where('category', isEqualTo: 'Graphics Card')
          .snapshots(), //products.snapshots(),
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
            //if (document.data()['title'].toString().contains(items[0])) {
            return inkwell(document, context);
            //}
            //else {
            // return Container(
            // height: 0,
            //    child: Text(''),
            //   );
            //   }
          }).toList(),
        );
      },
    );
  }

  InkWell inkwell(DocumentSnapshot document, BuildContext context) {
    return InkWell(
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
      child: new ListTile(
        trailing: IconButton(
          icon: new Icon(Icons.cancel_outlined),
          onPressed: () {
            print("removed");
          },
        ),
        leading: document.data()['imageURL'] == null
            ? Image.network(
                'https://firebasestorage.googleapis.com/v0/b/smartshopping-979f9.appspot.com/o/images%2FNo_Image_Available.jpg?alt=media&token=d109c767-611b-4cf4-a55f-4e0ad304f4c5')
            : Image.network(document.data()['imageURL']),
        title: new Text(document.data()['title']),
        subtitle: new Text(document.data()['price']),
      ),
    );
  }
}
