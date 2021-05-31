import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/vendor_settings.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';

class CustomerRename extends StatelessWidget {
  static const String id = 'customer_rename';
  @override
  Widget build(BuildContext context) {
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
              VendorSettings.name,
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
                print('Renamed Successfully');
              },
            ),
          ],
        ),
      ),
    );
  }
}
