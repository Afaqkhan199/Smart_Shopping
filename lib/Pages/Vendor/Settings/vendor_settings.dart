import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/change_location.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/change_phone.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/vendor_change_password.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/vendor_rename.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/vendor_home.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/change_description.dart';

final String ve = VendorHome().getEmail();
String name1 = '';
String phone1 = '';
String location1 = '';

DocumentSnapshot getUserDetails(){
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseFirestore.instance
      .collection('users')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      if(doc.data()['email'] == ve){
        print(doc["email"]);
        name1 = doc.data()['name'];
        phone1 = doc.data()['phone'];
        location1 = doc.data()['address'];
      }
    });
  });

}

class VendorSettings extends StatefulWidget {
  static const String id = 'vendor_settings';
  static final String name = name1;
  static final description = 'Shop Description';
  static final phone = phone1;
  static final location = location1;

  @override
  _VendorSettingsState createState() => _VendorSettingsState();
}

class _VendorSettingsState extends State<VendorSettings> {
  @override
  Widget build(BuildContext context) {
    setState(() {

    });
    getUserDetails();
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
                name1,
                //getSettings.document1.data()['name'],
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
                'Phone',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                phone1,
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pushNamed(context, UpdatePhone.id);
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
                location1,
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pushNamed(context, UpdateLocation.id);
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


