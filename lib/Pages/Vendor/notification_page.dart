import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';

class notification extends StatefulWidget {
  static const String id = 'notifications';
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
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
                  child: const SizedBox(
                    width: 300,
                    height: 100,
                    child: ListTile(title: Text('Select Product to link')),
                  ),
                ),
              ),
              RoundButton(
                title: "Send for Approval",
              )
            ],
          ),
        ),


    );
  }
}
