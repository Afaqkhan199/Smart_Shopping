import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/welcome_page.dart';
import 'package:fyp_smart_shopping/Services/auth.dart';
import 'package:fyp_smart_shopping/components/constants.dart';

class AdminHome extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static const String id = 'admin_home';
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
                  'SmartShopping Admin',
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
                  Navigator.pushNamed(context, AdminHome.id);
                },
              ),
              ListTile(
                title: Text('Chat'),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, AdminHome.id);
                },
              ),
              ListTile(
                title: Text('Vendors'),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, AdminHome.id);
                },
              ),
              ListTile(
                selectedTileColor: Colors.deepOrangeAccent,
                title: Text('History/Reports'),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, AdminHome.id);
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
