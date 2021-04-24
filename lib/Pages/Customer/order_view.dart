import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:intl/intl.dart';


class OrderView extends StatefulWidget {
  static const String id = 'order_view';
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.deepOrangeAccent,
      title: Text(
        'My Orders',
        style: kAppBarTitleTextStyle,
      ),
    ),
    body: Container(
      child: new ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) =>
              buildTripCard(context, index)),
    ),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Row(children: <Widget>[
                  Text("Order #4425"),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 40.0),
                child: Row(children: <Widget>[
                  Text(
                      "Items"),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text("Delivered"),
                    Spacer(),
                    Icon(Icons.beenhere_outlined),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}