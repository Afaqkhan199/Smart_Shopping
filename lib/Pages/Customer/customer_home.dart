import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/show_product.dart';
import 'package:fyp_smart_shopping/Pages/welcome_page.dart';
import 'package:fyp_smart_shopping/Services/auth.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:fyp_smart_shopping/components/text_box.dart';
import 'package:fyp_smart_shopping/Services/flutter_chat.dart';

var _categories = ['All', 'Cloths', 'Shoes', 'Bags', 'Glasses'];

// Product p1 = Product('Candy', 'T shirt Description', '1500', '15');
// Product p2 = Product('Mandy', 'T shirt Description', '2500', '20');
// Product p3 = Product('Nandy', 'T shirt Description', '3500', '25');

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
  var _selectedCategory = 'All';
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
                  'Customer' + 'User_Name',
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
                title: Text('My Orders'),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, CustomerHome.id);
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
            'Smart Shopping',
            style: kAppBarTitleTextStyle,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: TextBox(
                      hnt: 'Name',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
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
                            this._selectedCategory = newValue;
                          },
                        );
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
                        setState(() {
                          myColumn = getPrducts();
                        });
                        ;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: RoundButton(
                      title: 'Add item',
                      onPressed: () {
                        print('Add another search bar');
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
              myColumn,
            ],
          ),
        ),
      ),
    );
  }
}
