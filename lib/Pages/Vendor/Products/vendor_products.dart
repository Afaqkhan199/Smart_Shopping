import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_add_product.dart';
import 'package:fyp_smart_shopping/Pages/product.dart';

var _categories = ['All', 'Cloths', 'Shoes', 'Bags', 'Glasses'];

Product p1 = Product('Candy', 'T shirt Description', '1500', '15');
Product p2 = Product('Mandy', 'T shirt Description', '2500', '20');
Product p3 = Product('Nandy', 'T shirt Description', '3500', '25');

// List<Product> products = [p1, p2, p3];

class VendorProducts extends StatefulWidget {
  static const String id = 'vendor_products';
  List<String> getCategories() {
    return _categories;
  }

  @override
  _VendorProductsState createState() => _VendorProductsState();
}

class _VendorProductsState extends State<VendorProducts> {
  var _selectedCategory = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Products',
          style: kAppBarTitleTextStyle,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 35.0,
            ),
            onPressed: () {
              Navigator.pushNamed(context, VendorAddProduct.id);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Product Name',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepOrangeAccent, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepOrangeAccent, width: 2.0),
                      ),
                    ),
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
                    items: _categories.map((String dropDownStringItem) {
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
                      setState(() {
                        this._selectedCategory = newValue;
                      });
                    },
                    value: _selectedCategory,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: RoundButton(
                    title: 'Search',
                    onPressed: () {
                      print('Search a specific product');
                    },
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: RoundButton(
                    title: 'Add Category',
                    onPressed: () {
                      print('Add category triggers');
                    },
                  ),
                ),
              ],
            ),
            Text(
              '---------------------------------------------------------------------------------------------',
            ),
            Text(
              'All Products',
            ),
            SizedBox(
              height: 16,
            ),
            ShowProduct(
              product: p1,
            ),
            SizedBox(
              height: 10,
            ),
            ShowProduct(
              product: p2,
            ),
            SizedBox(
              height: 10,
            ),
            ShowProduct(
              product: p3,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
