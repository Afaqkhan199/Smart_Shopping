import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateProduct {
  UpdateProduct({this.doc});
  DocumentSnapshot doc;

  void updateLed() {
    print('update ' + doc.data()['title']);
  }

  void updateCharger() {
    print('update ' + doc.data()['title']);
  }

  void updateCard() {
    print('update ' + doc.data()['title']);
  }
}
