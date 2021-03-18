import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fyp_smart_shopping/components/text_box.dart';
import 'dart:io';

class CustomerSearchCard extends StatefulWidget {
  static const String id = 'customer_search_card';
  @override
  _CustomerSearchCardState createState() => _CustomerSearchCardState();
}

class _CustomerSearchCardState extends State<CustomerSearchCard> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController ramController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  String userEmail;
  String getCurrentUserEmail() {
    return userEmail = _auth.currentUser.email;
  }

  String newProductCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Add Graphic Card',
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
            TextBox(hnt: 'Enter product name', textController: nameController),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Model',
                  style: kFormTextStyle,
                ),
                SizedBox(
                  width: 151,
                ),
                Text(
                  'RAM',
                  style: kFormTextStyle,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    iconEnabledColor: Colors.deepOrangeAccent,
                    iconSize: 30,
                    items: _TypeCategories.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(
                        () {
                          // this._TypeSelectedCategory = newValue;
                        },
                      );
                    },
                    value: _TypeSelectedCategory,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    iconEnabledColor: Colors.deepOrangeAccent,
                    iconSize: 30,
                    items: _RamCategories.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(
                        () {
                          // this._RamSelectedCategory = newValue;
                        },
                      );
                    },
                    value: _RamSelectedCategory,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            RoundButton(
              title: 'Add item to list',
              onPressed: () {
                print('Add to list');
              },
            ),
          ],
        ),
      ),
    );
  }
}

var _TypeCategories = ['GTX1650', 'RTX3070', 'RTX3090'];
var _TypeSelectedCategory = 'GTX1650';

var _RamCategories = ['4GB', '8GB', '12GB'];
var _RamSelectedCategory = '4GB';
