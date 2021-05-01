import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:fyp_smart_shopping/components/text_area.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fyp_smart_shopping/components/text_box.dart';
import 'dart:io';
import 'customer_home.dart';

class CustomerSearchLed extends StatefulWidget {
  static const String id = 'customer_search_led';
  @override
  _CustomerSearchLedState createState() => _CustomerSearchLedState();
}

class _CustomerSearchLedState extends State<CustomerSearchLed> {
  Android _android = Android.N;

  final _auth = FirebaseAuth.instance;
  String userEmail;
  String getCurrentUserEmail() {
    return userEmail = _auth.currentUser.email;
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController companyController = TextEditingController();

  String newProductCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Add LED',
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
              height: 15,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Size (in inches)',
                  style: kFormTextStyle,
                ),
                SizedBox(
                  width: 67,
                ),
                Text(
                  'Resolution',
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
                    items: _SizeCategories.map((String dropDownStringItem) {
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
                          _SizeSelectedCategory = newValue;
                        },
                      );
                    },
                    value: _SizeSelectedCategory,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    iconEnabledColor: Colors.deepOrangeAccent,
                    iconSize: 30,
                    items: _ResCategories.map((String dropDownStringItem) {
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
                          _ResSelectedCategory = newValue;
                        },
                      );
                    },
                    value: _ResSelectedCategory,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  'Android',
                  style: kFormTextStyle,
                ),
                SizedBox(
                  width: 30,
                ),
                Radio(
                  value: Android.N,
                  groupValue: _android,
                  onChanged: (Android value) {
                    setState(
                      () {
                        _android = value;
                      },
                    );
                  },
                ),
                const Text('No'),
                Radio(
                  value: Android.Y,
                  groupValue: _android,
                  onChanged: (Android value) {
                    setState(
                      () {
                        _android = value;
                      },
                    );
                  },
                ),
                const Text('Yes'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RoundButton(
              title: 'Add item to list',
              onPressed: () {
                if(nameController.text!=""){
                items.add(nameController.text);
                Navigator.pushNamed(context, CustomerHome.id);}
                else{
                  final snackBar = SnackBar(content: Text('Enter Item Name First'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                //print('Add to list');
              },
            ),
          ],
        ),
      ),
    );
  }
}

var _SizeCategories = ['16', '32', '40'];
var _SizeSelectedCategory = '16';

var _ResCategories = ['720p', '1080p', '4k'];
var _ResSelectedCategory = '720p';
enum Android { Y, N }
