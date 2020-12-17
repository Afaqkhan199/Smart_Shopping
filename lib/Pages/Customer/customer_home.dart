import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';

class CustomerHome extends StatelessWidget {
  static const String id = 'customer_home';
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
                  Navigator.pushNamed(context, CustomerHome.id);
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
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, CustomerHome.id);
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
          child: Card(
            color: Colors.teal,
            child: Text(
              'Customer\'s search area',
            ),
          ),
        ),
      ),
    );
  }
}
