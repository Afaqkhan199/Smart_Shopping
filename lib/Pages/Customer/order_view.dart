import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderView extends StatelessWidget {
  static const String id = 'order_view';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) =>
              buildTripCard(context, index)),
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