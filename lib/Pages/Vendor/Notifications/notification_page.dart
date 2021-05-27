import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_products.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Notifications/select_item.dart';

String prodName = 'yes poop?';


class notification extends StatefulWidget {
  static const String id = 'notifications';
  @override
  _notificationState createState(){
    return _notificationState();
  }
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    String prodName2 = prodName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          'Send Notification',
          style: kAppBarTitleTextStyle,
        ),
      ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: ListView(
            children: <Widget>[
              TextField(
                onChanged: (value) {
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Notification Text'),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card tapped.');
                  },
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: ListTile(title: Text(prodName2),
                    ),
                  ),
                ),
              ),
              RoundButton(
                title: "Select Product", onPressed: ()=> Navigator.pushNamed(context, SelectItem.id),
              ),
              RoundButton(
                title: "Send for Approval",
                onPressed:(){
                  prodName2 = prodName;
                  print("approval pressed");
                  setState(() {});
                },
              ),
            ],
          ),
        ),


    );
  }
}
