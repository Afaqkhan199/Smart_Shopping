import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_products.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:fyp_smart_shopping/components/text_area.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fyp_smart_shopping/components/text_box.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class CustomerSearchPhone extends StatefulWidget {
  static const String id = 'customer_search_phone';
  @override
  _VendorAddProductState createState() => _VendorAddProductState();
}

class _VendorAddProductState extends State<CustomerSearchPhone> {
  OS _os = OS.Android;

  String newProductCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Search Mobile',
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
            ), //textController: nameController),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Camera',
                    style: kFormTextStyle,
                  ),
                ),
                Expanded(
                  child: Text(
                    'RAM',
                    style: kFormTextStyle,
                  ),
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
                    items: _CameraCategories.map((String dropDownStringItem) {
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
                          _CameraSelectedCategory = newValue;
                        },
                      );
                    },
                    value: _CameraSelectedCategory,
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
                          _RamSelectedCategory = newValue;
                        },
                      );
                    },
                    value: _RamSelectedCategory,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: OS.Android,
                  groupValue: _os,
                  onChanged: (OS value) {
                    setState(
                      () {
                        _os = value;
                      },
                    );
                  },
                ),
                const Text('Android'),
                Radio(
                  value: OS.IPhone,
                  groupValue: _os,
                  onChanged: (OS value) {
                    setState(
                      () {
                        _os = value;
                      },
                    );
                  },
                ),
                const Text('IPhone'),
              ],
            ),

            SizedBox(
              height: 50,
            ),

            RoundButton(
              title: 'Save',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

var _CameraCategories = ['13', '48', '64'];
var _CameraSelectedCategory = '13';

var _RamCategories = ['3GB', '4GB', '6GB'];
var _RamSelectedCategory = '3GB';
enum OS { Android, IPhone }
