import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_add_card.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_add_led.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_add_charger.dart';
import 'package:fyp_smart_shopping/Widgets/product_listview.dart';

class VendorProducts extends StatefulWidget {
  getCategories() {
    return _categories;
  }

  static const String id = 'vendor_products';
  @override
  _VendorProductsState createState() => _VendorProductsState();
}

class _VendorProductsState extends State<VendorProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Products',
          style: kAppBarTitleTextStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 24),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
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
                      setState(
                        () {
                          _selectedCategory = newValue;
                        },
                      );
                    },
                    value: _selectedCategory,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: RoundButton(
                    title: 'Show',
                    onPressed: () {
                      //Check  category, show products
                    },
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: RoundButton(
                    title: 'Add',
                    onPressed: () {
                      if (_selectedCategory == 'LED')
                        Navigator.pushNamed(context, VendorAddLed.id);
                      else if (_selectedCategory == 'Graphic Card')
                        Navigator.pushNamed(context, VendorAddCard.id);
                      else if (_selectedCategory == 'Charger')
                        Navigator.pushNamed(context, VendorAddCharger.id);
                      else
                        print(_selectedCategory);
                      //Check category, show respective interface
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
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                ),
                child: ProductsListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

var _categories = ['All', 'LED', 'Graphic Card', 'Charger'];
var _selectedCategory = 'All';
