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

class VendorAddCard extends StatefulWidget {
  static const String id = 'vendor_add_card';
  @override
  _VendorAddProductState createState() => _VendorAddProductState();
}

class _VendorAddProductState extends State<VendorAddCard> {
  File _img;
  Future productImage() async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _img = img;
    });
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController ramController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  String userEmail;
  String getCurrentUserEmail()  {
    return userEmail = _auth.currentUser.email;
  }

  addData(){
    Map<String,dynamic> productData = {"title" : nameController.text,
      "description" : descriptionController.text,
      "model" : _TypeSelectedCategory,
      "ram" : _RamSelectedCategory,
      "price" : priceController.text,
      "category" : "Graphics Card",
      "vendorEmail" : getCurrentUserEmail()
    };

    CollectionReference collectionReference = Firestore.instance.collection('products');
    collectionReference.add(productData);
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
            TextBox(hnt: 'Enter product name', textController: nameController ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Description',
              style: kFormTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            TextArea(hnt: 'Description of the product', textController: descriptionController),
            SizedBox(
              height: 15,
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
            Row(
              children: <Widget>[
                Text(
                  'Price',
                  style: kFormTextStyle,
                ),
                SizedBox(
                  width: 150,
                ),
                Text(
                  'Image',
                  style: kFormTextStyle,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextBox(hnt: 'Price per item', textController: priceController),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Material(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(8.0),
                    elevation: 5.0,
                    child: MaterialButton(
                      child: Text(
                        'Upload',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      onPressed: productImage,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: _img == null
                  ? Text('No Image Selected')
                  : Image.file(_img, width: 200, height: 200),
            ),
            SizedBox(
              height: 20,
            ),
            RoundButton(
              title: 'Save',
              onPressed: () {
                print('Save data to firebase');
                addData();
                print('data added');
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
