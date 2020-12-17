import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Admin/admin_home.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'file:///D:/Study_Material/CUI-FA17-BSE-ISL/FYP-Smart_Shopping/fyp_smart_shopping/lib/Pages/Vendor/Settings/vendor_settings.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_products.dart';

class VendorHome extends StatelessWidget {
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
                  Navigator.pushNamed(context, VendorProducts.id);
                },
              ),
              ListTile(
                title: Text('Chat'),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, VendorHome.id);
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
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, AdminHome.id);
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
              Tab(icon: Icon(Icons.autorenew)),
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
                children: <Text>[
                  Text('Vendor here'),
                  Text('Pending Orders'),
                  Text('Row 1'),
                  Text('Row 2'),
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
