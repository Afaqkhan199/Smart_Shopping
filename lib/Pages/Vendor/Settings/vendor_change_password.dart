import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';

class VendorChangePassword extends StatelessWidget {
  static const String id = 'vendor_change_password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Change Password',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 24.0),
        child: ListView(
          children: <Widget>[
            TextField(
              obscureText: true,
              onChanged: (value) {
                //Get user's input
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter current password'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                //Get user's input
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'New password'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                //Get user's input
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Confirm new password'),
            ),
            SizedBox(
              height: 20,
            ),
            RoundButton(
              title: 'Save',
              onPressed: () {
                print('Password successfully changed');
              },
            ),
          ],
        ),
      ),
    );
  }
}
