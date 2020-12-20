import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_products.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fyp_smart_shopping/components/text_box.dart';
import 'dart:io';

class VendorAddProduct extends StatefulWidget {
  static const String id = 'vendor_add_product';
  @override
  _VendorAddProductState createState() => _VendorAddProductState();
}

class _VendorAddProductState extends State<VendorAddProduct> {
  File _img;
  Map data;

  final TextEditingController TitleController = TextEditingController();
  final TextEditingController DescriptionController = TextEditingController();
  final TextEditingController PriceController = TextEditingController();
  final TextEditingController QuantityController = TextEditingController();
  final TextEditingController CategoryController = TextEditingController();

  addData(){
    Map<String,dynamic> productData = {"title" : TitleController.text,
      "description" : DescriptionController.text,
      "price" : PriceController.text,
      "quantity" : QuantityController.text };

    CollectionReference collectionReference = Firestore.instance.collection('products');
    collectionReference.add(productData);
  }

  fetchData(){
    CollectionReference collectionReference = Firestore.instance.collection('products');
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        data = snapshot.documents[0].data();
      });
    });
  }

  Future productImage() async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _img = img;
    });
  }

  String newProductCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Add Product',
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
            TextField(
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Product Name'),
              controller: TitleController,
            ),
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
            TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Description of the product'),
              controller: DescriptionController),
            SizedBox(
              height: 15,
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
                  'Quantity',
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
                  child: TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Price per item'),
                      controller: PriceController),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Quantity'),
    controller: QuantityController),
                )
              ],
            ),
            //Ahmar, apply a check on this textfield's data (acceptDigitsOnly)
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Category',
                  style: kFormTextStyle,
                ),
                SizedBox(
                  width: 120,
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.deepOrangeAccent,
                        iconEnabledColor: Colors.white,
                        iconSize: 50,
                        items: VendorProducts()
                            .getCategories()
                            .map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(
                              dropDownStringItem,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            this.newProductCategory = newValue;
                          });
                        },
                        value: newProductCategory,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
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
                addData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
