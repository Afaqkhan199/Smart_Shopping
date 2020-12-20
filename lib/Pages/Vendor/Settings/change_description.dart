import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/vendor_settings.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:fyp_smart_shopping/components/text_box.dart';

class ChangeDescription extends StatelessWidget {
  static const String id = 'change_description';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Description',
          style: kAppBarTitleTextStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: ListView(
          children: <Widget>[
            Text(
              VendorSettings.description,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(
              height: 120,
            ),
            TextBox(hnt: 'Type a new one'),
            RoundButton(
              title: 'Save',
              onPressed: () {
                print('Update Description Successfully');
              },
            ),
          ],
        ),
      ),
    );
  }
}
