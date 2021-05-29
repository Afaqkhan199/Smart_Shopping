import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fyp_smart_shopping/components/text_box.dart';
import 'package:fyp_smart_shopping/components/text_area.dart';
import 'dart:io';
import '../customer_home.dart';

class CustomerSearchCharger extends StatefulWidget {
  static const String id = 'customer_search_charger';
  @override
  _CustomerSearchChargerState createState() => _CustomerSearchChargerState();
}

class _CustomerSearchChargerState extends State<CustomerSearchCharger> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController companyController = TextEditingController();

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
          'Add Charger',
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
                  'Type',
                  style: kFormTextStyle,
                ),
                SizedBox(
                  width: 150,
                ),
                Text(
                  'Company',
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
                  width: 20,
                ),
                Expanded(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    iconEnabledColor: Colors.deepOrangeAccent,
                    iconSize: 30,
                    items: _CompanyCategories.map((String dropDownStringItem) {
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
                          // this._CompanySelectedCategory = newValue;
                        },
                      );
                    },
                    value: _CompanySelectedCategory,
                  ),
                ),
              ],
            ),
            RoundButton(
              title: 'Add item to list',onPressed: () {
              if(nameController.text!=""){
                SearchKeywords.add(nameController.text);
                List<String> searchKeys = nameController.text.split(" ");
                items.addAll(searchKeys);
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

var _TypeCategories = ['Normal', 'Fast', 'Ultra Fast'];
var _TypeSelectedCategory = 'Normal';

var _CompanyCategories = ['MI', 'Vivo', 'Realme'];
var _CompanySelectedCategory = 'MI';
