import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Customer/customer_home.dart';


class AddToCart{
  List<String> imgUrl = [];

  CollectionReference users = FirebaseFirestore.instance.collection('cart');

  Future<Void> addFirst(){
    users.doc(getEmail()).update({"product_url": FieldValue.arrayUnion(imgUrl)});
  }

  Future<void> updateCart() {
    return users
        .doc(getEmail())
        .set({
      'product_url': imgUrl,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}