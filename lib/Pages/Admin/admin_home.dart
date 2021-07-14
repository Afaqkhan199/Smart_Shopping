import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Admin/Notification%20Approval/Orders/adminOrders.dart';
import 'package:fyp_smart_shopping/Pages/Admin/Vendors%20List/adminVendors.dart';
import 'package:fyp_smart_shopping/Pages/welcome_page.dart';
import 'package:fyp_smart_shopping/Services/auth.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/Pages/Admin/Notification%20Approval/admin_notifications.dart';

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
                title: Text('Orders'),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, AdminOrders.id);
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
                  Navigator.pushNamed(context, AdminVendors.id);
                },
              ),
              ListTile(
                title: Text('Notifications'),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.pushNamed(context, NotificationApproval.id);
                },
              ),
              //ListTile(
                //selectedTileColor: Colors.deepOrangeAccent,
               // title: Text('History/Reports'),
               // onTap: () {
                  // Navigator.pop(context);
                 // Navigator.pushNamed(context, AdminHome.id);
                //},
             // ),
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

        //   bottom: TabBar(
        //     tabs: [
        //       Tab(icon: Icon(Icons.autorenew)),
        //       Tab(icon: Icon(Icons.check_circle)),
        //       Tab(icon: Icon(Icons.directions_bike)),
        //     ],
        //   ),
        // ),
        // body: Padding(
        //   padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          // child: TabBarView(
          //   children: <ListView>[
          //     ListView(
          //       children: <Text>[
          //         Text('Pending Orders'),
          //         Text('Row 1'),
          //         Text('Row 2'),
          //       ],
          //     ),
          //     ListView(
          //       children: <Text>[
          //         Text('Approved Orders'),
          //         Text('Row 1'),
          //         Text('Row 2'),
          //       ],
          //     ),
          //     ListView(
          //       children: <Text>[
          //         Text('Deployed Orders'),
          //         Text('Row 1'),
          //         Text('Row 2'),
          //       ],
          //     )
          //   ],
          // ),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('images/Logo.png'),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                              Colors.black.withOpacity(.4),
                              Colors.black.withOpacity(.2),
                            ]
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("Smart Shopping", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                        SizedBox(height: 30,),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                          child: Center(child: Text("Shopping Made Smart", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold))),
                        ),
                        SizedBox(height: 30,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
