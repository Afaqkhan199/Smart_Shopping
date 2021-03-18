import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Admin/admin_home.dart';
import 'package:fyp_smart_shopping/Pages/welcome_page.dart';
import 'package:fyp_smart_shopping/Services/auth.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/vendor_settings.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_products.dart';
import 'package:fyp_smart_shopping/Services/flutter_chat.dart';

class VendorHome extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static const String id = 'vendor_home';
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
                  'Vendor' + 'User_Name',
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
                  Navigator.pushNamed(context, VendorHome.id);
                },
              ),
              ListTile(
                selectedTileColor: Colors.deepOrangeAccent,
                title: Text('Products'),
                onTap: () {
                  // Navigator.pop(context);
                  //Navigator.pushNamed(context, VendorProducts.id);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      VendorProducts.id, (Route<dynamic> route) => false);
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
                selectedTileColor: Colors.deepOrangeAccent,
                title: Text('History/Reports'),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, VendorHome.id);
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
            'Smart Shopping',
            style: kAppBarTitleTextStyle,
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.autorenew),
              ),
              Tab(icon: Icon(Icons.check_circle)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: TabBarView(
            children: <ListView>[
              ListView(
                children: <Widget>[
                  // Text('Vendor here'),
                  // Text('Pending Orders'),
                  // Text('Row 1'),
                  // Text('Row 2'),
                  Text(
                    'Order Id: 32524',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Image(
                    image: AssetImage('images/order.jpg'),
                  ),
                ],
              ),
              ListView(
                children: <Text>[
                  Text('Approved Orders'),
                  Text('Row 1'),
                  Text('Row 2'),
                ],
              ),
              ListView(
                children: <Text>[
                  Text('Deployed Orders'),
                  Text('Row 1'),
                  Text('Row 2'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
