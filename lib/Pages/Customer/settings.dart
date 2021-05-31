import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/vendor_change_password.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/vendor_rename.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/change_description.dart';

import 'customer_rename.dart';

class CustomerSettings extends StatelessWidget {
  static const String id = 'customer_settings';
  static final String name = 'Name';
  static final location = 'Islamabad';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Settings',
          style: kAppBarTitleTextStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'Name',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                name,
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pushNamed(context, CustomerRename.id);
              },
            ),
            ListTile(
              title: Text(
                '--------------------------------------------------------------------------',
              ),
            ),
            ListTile(
              title: Text(
                'Password',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                'Change password',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pushNamed(context, VendorChangePassword.id);
              },
            ),
            ListTile(
              title: Text(
                '--------------------------------------------------------------------------',
              ),
            ),
            ListTile(
              title: Text(
                'Location',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                location,
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pushNamed(context, VendorRename.id);
              },
            ),
            ListTile(
              title: Text(
                '--------------------------------------------------------------------------',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
