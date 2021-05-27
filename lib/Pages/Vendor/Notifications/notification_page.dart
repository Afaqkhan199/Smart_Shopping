import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_products.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Notifications/select_item.dart';
import 'package:fyp_smart_shopping/components/text_box.dart';

String prodName = 'No Product Selected';


class notification extends StatefulWidget {
  static const String id = 'notifications';
  @override
  _notificationState createState(){
    return _notificationState();
  }
}

class _notificationState extends State<notification> {
  final TextEditingController nameController = TextEditingController();
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
              TextBox(hnt: 'Enter Notification Text', textController: nameController),
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
                title: "Select Product", onPressed: () {
                Navigator.of(context).pushNamed(SelectItem.id).then((value) => setState(() {}));
                  //Navigator.pushNamed(context, SelectItem.id);
              },
              ),
              RoundButton(
                title: "Send for Approval",
                onPressed:(){
                  if(prodName!='No Product Selected' && nameController.text!="")
                  print("approval pressed!");
                  else{
                    final snackBar = SnackBar(content: Text('Select Item and Enter Text First'));
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
