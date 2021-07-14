import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp_smart_shopping/Pages/Admin/Notification Approval/show_details.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fyp_smart_shopping/Pages/Admin/grid_test.dart';

class NotificationDetails extends StatefulWidget {
  const NotificationDetails({Key key}) : super(key: key);
  static const String id = 'notifDetails';

  @override
  _NotificationDetailsState createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Map<String, dynamic> productDetails = product.data();
  FirebaseStorage _storage = FirebaseStorage.instance;
  CollectionReference requests =
  FirebaseFirestore.instance.collection('notifications');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.deepOrangeAccent,
      title: Text(
        'Notification Details',
        style: kAppBarTitleTextStyle,
      ),
    ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: <Widget>[
            Text("Product Name:",
            ),
            Text("${data['title']}"),
            Text("Notification Text:",
              style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 0.5),
            ),
            Text("${data['NotificationText']}"),
            Text("Vendor:",
              style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 0.5),
            ),
            Text("${data['vendorEmail']}"),
           // RoundButton(
           //     title: "Send Notification",
           //   onPressed: () {
            //  print('notification sent');
          //  },
         //   ),
            RoundButton(
              title: "Dismiss Notification",
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, HomePage.id);
                print("test");
              },
            ),
          ],
        ),
      ),
    );
  }
}
