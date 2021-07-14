import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Search/customer_search_phone.dart';
import 'package:fyp_smart_shopping/Pages/Customer/settings.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/vendor_settings.dart';
import 'package:fyp_smart_shopping/Pages/show_product.dart';
import 'package:fyp_smart_shopping/Pages/welcome_page.dart';
import 'package:fyp_smart_shopping/Services/auth.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:fyp_smart_shopping/components/text_box.dart';
import 'package:fyp_smart_shopping/Services/flutter_chat.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Search/customer_search_led.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Search/customer_search_card.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Search/customer_search_charger.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Order/order_view.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Search/search_results.dart';
import 'package:fyp_smart_shopping/Pages/Customer/Cart/cart.dart';

import 'Search/cutomer_search_general.dart';
// var _categories = ['All', 'Cloths', 'Shoes', 'Bags', 'Glasses'];

// Product p1 = Product('Candy', 'T shirt Description', '1500', '15');
// Product p2 = Product('Mandy', 'T shirt Description', '2500', '20');
// Product p3 = Product('Nandy', 'T shirt Description', '3500', '25');

String getEmail() {
  User user = FirebaseAuth.instance.currentUser;
  return user.email.toString();
}

Widget getPrducts() {
  return Column(
    children: [
      ShowProduct(
          // product: p1,
          ),
      ShowProduct(
          // product: p2,
          ),
      ShowProduct(
          // product: p3,
          ),
    ],
  );
}

List<String> items = [];
List<String> SearchKeywords = [];
List ProductObjects = [];

class CustomerHome extends StatefulWidget {
  static const String id = 'customer_home';
  @override
  _CustomerHomeState createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Widget myColumn = Column(
    children: [
      Text(
        'No data',
        style: kFormTextStyle,
      ),
    ],
  );
  // var _selectedCategory = 'All';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  getEmail(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, CustomerHome.id);
                },
              ),
              ListTile(
                title: Text('Chat'),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, ChatDetailPage.id);
                },
              ),
              ListTile(
                title: Text('Cart'),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, cart.id);
                },
              ),
              ListTile(
                title: Text('My Orders'),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, OrderView.id);
                },
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, VendorSettings.id);
                },
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () async {
                  await _auth.signOut();
                  Navigator.pushNamed(context, Welcome.id);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(
            'List&Filtered Search',
            style: kAppBarTitleTextStyle,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                print("Shopping Cart");
              },
            ),
          ],
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
                      title: 'Add Item',
                      onPressed: () {
                        if (_selectedCategory == 'LED')
                          Navigator.pushNamed(context, CustomerSearchLed.id);
                        else if (_selectedCategory == 'Graphic Card')
                          Navigator.pushNamed(context, CustomerSearchCard.id);
                        else if (_selectedCategory == 'Charger')
                          Navigator.pushNamed(
                              context, CustomerSearchCharger.id);
                        else if (_selectedCategory == 'Mobile')
                          Navigator.pushNamed(context, CustomerSearchPhone.id);
                        else if (_selectedCategory == 'General')
                          Navigator.pushNamed(
                              context, CustomerSearchGeneral.id);
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
              RoundButton(
                title: 'Search List',
                onPressed: () {
                  //ProductObjects.clear();
                  print(ProductObjects.length);
                  for(int i=0;i<SearchKeywords.length;i++)
                    print(SearchKeywords[i]);
                  if (SearchKeywords.isNotEmpty)
                    Navigator.pushNamed(context, SearchResults.id);
                },
              ),
              Text(
                'Your list of items',
                style: kFormTextStyle.copyWith(color: Colors.grey),
              ),
              Text(
                '---------------------------------------------------------------------------------------------',
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: SearchKeywords.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: <Widget>[
                        Expanded(
                            child: ListTile(
                          title: Text(SearchKeywords[index]),
                        )),
                        Spacer(),
                        IconButton(
                          icon: new Icon(Icons.cancel_outlined),
                          onPressed: () {
                            SearchKeywords.removeAt(index);
                            setState(() {});
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var _categories = ['General', 'LED', 'Graphic Card', 'Charger', 'Mobile'];
var _selectedCategory = 'General';
