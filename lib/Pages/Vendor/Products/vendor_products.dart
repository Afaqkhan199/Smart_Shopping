import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/product.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_add_card.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_add_led.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_add_charger.dart';
import 'package:fyp_smart_shopping/Widgets/product_listview.dart';
import 'package:fyp_smart_shopping/components/text_area.dart';

class VendorProducts extends StatefulWidget {
  getCategories() {
    return _categories;
  }

  static const String id = 'vendor_products';
  @override
  _VendorProductsState createState() => _VendorProductsState();
}

class _VendorProductsState extends State<VendorProducts> {
  List<Product> productList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseReference referenceData=FirebaseDatabase.instance.reference().child("products");
    referenceData.once().then((DataSnapshot dataSnapShot){
      productList.clear();
      var keys=dataSnapShot.value.keys;
      var values=dataSnapShot.value;

      for(var key in keys){
        Product data=new Product(
          values [key]["title"],
          values [key]["price"],
          values [key]["imageURL"],
        );
        productList.add(data);
      }
      setState(() {
        //
      });
    });
  }

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
              // child: Container(
              //   padding: EdgeInsets.symmetric(horizontal: 20),
              //   decoration: BoxDecoration(
              //     color: Colors.deepOrangeAccent,
              //   ),
              child: productList.length == 0 ? Center(child: Text("No items", style: TextStyle(fontSize: 30.0),)):ListView.builder(itemCount:productList.length,itemBuilder: (_,index){
                return CardUI(productList[index].imageURL,productList[index].title,productList[index].price);
              },
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}

Widget CardUI(String imgURL, String name, String cost){
  return Card(
    elevation: 7,
    margin: EdgeInsets.all(15),
    color: Colors.deepOrangeAccent,
    child: Container(
      color: Colors.white,
      margin: EdgeInsets.all(1.5),
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Image.network(imgURL, fit: BoxFit.cover,height: 100,),
          SizedBox(height: 1),
          Text(name,style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 1),
          Container(
            width: double.infinity,
            child: Text(cost,style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
          ),
          SizedBox(height: 1),
        ],
      ),
    ),
  );
}
var _categories = ['All', 'LED', 'Graphic Card', 'Charger'];
var _selectedCategory = 'All';
