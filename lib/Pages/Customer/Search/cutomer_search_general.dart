import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Search/search_classes.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:fyp_smart_shopping/components/text_area.dart';
import 'package:fyp_smart_shopping/components/text_box.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import '../customer_home.dart';

class CustomerSearchGeneral extends StatefulWidget {
  static const String id = 'customer_search_general';
  @override
  _VendorAddProductState createState() => _VendorAddProductState();
}

var General = new SearchGeneral();

class _VendorAddProductState extends State<CustomerSearchGeneral> {
  FirebaseStorage _storage = FirebaseStorage.instance;
  final _auth = FirebaseAuth.instance;
  String userEmail;
  String getCurrentUserEmail() {
    return userEmail = _auth.currentUser.email;
  }

  final TextEditingController nameController = TextEditingController();

  String newProductCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Search General',
          style: kAppBarTitleTextStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: ListView(
          children: <Widget>[
            Text(
              'Title',
              style: kFormTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            TextBox(
              hnt: 'Enter product name',
              textController: nameController,
            ),
            SizedBox(
              height: 15,
            ),
            RoundButton(
              title: 'Save',
              onPressed: () {
                if (nameController.text != "") {
                  SearchKeywords.add(nameController.text);
                  General.title = nameController.text;
                  ProductObjects.add(General);
                  List<String> searchKeys = nameController.text.split(" ");
                  items.addAll(searchKeys);
                  Navigator.pushNamed(context, CustomerHome.id);
                } else {
                  final snackBar =
                      SnackBar(content: Text('Enter Item Name First'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
