import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Admin/Notification%20Approval/notification_details.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/Pages/Admin/Notification Approval/show_details.dart';

class NotificationApproval extends StatefulWidget {
  const NotificationApproval({Key key}) : super(key: key);
  static const String id = 'notifRequests';

  @override
  _NotificationApprovalState createState() => _NotificationApprovalState();
}

class _NotificationApprovalState extends State<NotificationApproval> {
  FirebaseStorage _storage = FirebaseStorage.instance;
  CollectionReference notificationRequests =
  FirebaseFirestore.instance.collection('notifications');

  int length;

  int getLength(){
    notificationRequests.get().then((value){
      length = value.size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(
            'Notification Requests',
            style: kAppBarTitleTextStyle,
          ),
        ),
        body: Row(
          children: <Widget>[
            Expanded(child: ShowDetails())
          ],
        )
    );
  }}
