import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/vendor_settings.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';

TextEditingController newLocation = TextEditingController();
String currentLocation = '';

void changeLocation(){
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseFirestore.instance
      .collection('users')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      if(doc.data()['email'] == ve){
        doc.reference.update({'address': newLocation.text});
      }
    });
  });}

void getCurrentLocation(){
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseFirestore.instance
      .collection('users')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      if(doc.data()['email'] == ve){
        currentLocation = doc.data()['address'];
      }
    });
  });
}

class UpdateLocation extends StatefulWidget {
  static const String id = 'change_address';

  @override
  _UpdateLocationState createState() => _UpdateLocationState();
}

class _UpdateLocationState extends State<UpdateLocation> {
  @override
  Widget build(BuildContext context) {
    getCurrentLocation();
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
              currentLocation,
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
              '  is your current address.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            TextField(
              controller: newLocation,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter a new address',
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
                if(newLocation.text!=''){
                  changeLocation();
                  setState(() {
                  });
                  final snackBar = SnackBar(content: Text('Address Updated Successfully'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //Navigator.pushNamed(context, VendorSettings.id);
                  Navigator.pop(context);}
                else{
                  final snackBar = SnackBar(content: Text('Please Enter Address'));
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

