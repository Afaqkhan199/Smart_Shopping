import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/vendor_change_password.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/vendor_rename.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/change_description.dart';

class VendorSettings extends StatelessWidget {
  static const String id = 'vendor_settings';
  static final String name = 'Dummy name';
  static final description = 'Hey there, this is a dummy description';
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
                Navigator.pushNamed(context, VendorRename.id);
              },
            ),
            ListTile(
              title: Text(
                '--------------------------------------------------------------------------',
              ),
            ),
            ListTile(
              title: Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                description,
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pushNamed(context, ChangeDescription.id);
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
