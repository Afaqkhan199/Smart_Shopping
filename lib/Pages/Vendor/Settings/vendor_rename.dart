import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/vendor_settings.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';

TextEditingController newName = TextEditingController();
String currentName = '';

void renameUser(){
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseFirestore.instance
      .collection('users')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      if(doc.data()['email'] == ve){
        doc.reference.update({'name': newName.text});
      }
    });
  });
}

void getCurrentName(){
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseFirestore.instance
      .collection('users')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      if(doc.data()['email'] == ve){
        currentName = doc.data()['name'];
      }
    });
  });
}


class VendorRename extends StatefulWidget {
  static const String id = 'vendor_rename';

  @override
  _VendorRenameState createState() => _VendorRenameState();
}

class _VendorRenameState extends State<VendorRename> {
  @override
  Widget build(BuildContext context) {
    getCurrentName();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Rename',
          style: kAppBarTitleTextStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: ListView(
          children: <Widget>[
            Text(
              currentName,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              '  is your current name.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            TextField(
              controller: newName,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter a new name',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.deepOrangeAccent, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                ),
              ),
            ),
            RoundButton(
              title: 'Save',
              onPressed: () {
                if(newName.text!=''){
                renameUser();
                setState(() {
                });
                final snackBar = SnackBar(content: Text('Renamed Successfully'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //Navigator.pushNamed(context, VendorSettings.id);
                Navigator.pop(context);}
                else{
                  final snackBar = SnackBar(content: Text('Please Enter New Name'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  }