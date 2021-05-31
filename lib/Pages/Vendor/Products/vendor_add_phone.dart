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

class VendorAddPhone extends StatefulWidget {
  static const String id = 'vendor_add_phone';
  @override
  _VendorAddProductState createState() => _VendorAddProductState();
}

class _VendorAddProductState extends State<VendorAddPhone> {
  File _img;
  OS _os = OS.Android;
  FirebaseStorage _storage = FirebaseStorage.instance;

  String imgURL;

  Future productImage() async {
    var img = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _img = File(img.path);
    });
  }

  uploadPic() async {
    try {
      await _storage.ref("images/${nameController.text}").putFile(_img);
    } on FirebaseException {}
  }

  Future<void> downloadURL() async {
    imgURL =
        await _storage.ref("images/${nameController.text}").getDownloadURL();
  }

  final _auth = FirebaseAuth.instance;
  String userEmail;
  String getCurrentUserEmail() {
    return userEmail = _auth.currentUser.email;
  }

  uploadData() async {
    await uploadPic();
    await downloadURL();
    addData();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  addData() async {
    String lowerCase = nameController.text.toLowerCase();
    String upperCase = nameController.text.toUpperCase();
    List<String> normalSplit = nameController.text.split(" ");
    List<String> upperSplit = upperCase.split(" ");
    List<String> lowerSplit = lowerCase.split(" ");
    List<String> searchKey = normalSplit + upperSplit + lowerSplit;

    await uploadPic();
    String operatingSys;
    if (_os.toString() == "OS.Android") {
      operatingSys = "Android";
    } else {
      operatingSys = "IPhone";
    }

    Map<String, dynamic> productData = {
      "title": nameController.text,
      "description": descriptionController.text,
      "category": "Mobile",
      "camera": _CameraSelectedCategory,
      "ram": _RamSelectedCategory,
      "os": operatingSys,
      "price": priceController.text,
      "vendorEmail": getCurrentUserEmail(),
      "imageURL": imgURL,
      "keywords": searchKey,
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('products');
    collectionReference.add(productData);
  }

  String newProductCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Add Mobile',
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
            Text(
              'Description',
              style: kFormTextStyle,
            ),
            SizedBox(
              height: 10,
            ),
            TextArea(
                hnt: 'Description of the product',
                textController: descriptionController),
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
                // Text(
                //   '',
                //   style: kFormTextStyle,
                // ),
                // SizedBox(
                //   width: 30,
                // ),
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
                  child: TextBox(hnt: 'Price', textController: priceController),
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
                if(nameController.text!="" && descriptionController.text!="" && priceController.text!=""){
                  print('Save data to firebase');
                  uploadData();
                  final snackBar = SnackBar(content: Text('Uploading...'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pushNamed(context, VendorProducts.id);
                }
                else{
                  final snackBar = SnackBar(content: Text('Enter all details'));
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

var _CameraCategories = ['13', '48', '64'];
var _CameraSelectedCategory = '13';

var _RamCategories = ['3GB', '4GB', '6GB'];
var _RamSelectedCategory = '3GB';
enum OS { Android, IPhone }
