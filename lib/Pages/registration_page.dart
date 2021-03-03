import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/or_formatting.dart';
import 'package:fyp_smart_shopping/components/google_path.dart';

enum Users { Customer, Vendor }

class Register extends StatefulWidget {
  static const String id = 'registration_page';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Users _user = Users.Customer;


  addData(){
    Map<String,dynamic> productData = {"email" : emailController.text,
      "type" : _user.toString(),
      "name" : nameController.text
    };

    CollectionReference collectionReference = Firestore.instance.collection('users');
    collectionReference.add(productData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: <Widget>[
            Hero(
              tag: 'Logo',
              child: Container(
                height: 150.0,
                child: Image.asset('images/Logo.png'),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              controller: nameController,
              onChanged: (value) {
                //Get user's input
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Name'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: emailController,
              onChanged: (value) {
                //Get user's input
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Email'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              onChanged: (value) {
                //Get user's input
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Password'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: confirmPassword,
              obscureText: true,
              onChanged: (value) {
                //Get user's input
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Confirm Password'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: Users.Customer,
                  groupValue: _user,
                  onChanged: (Users value) {
                    setState(
                      () {
                        _user = value;
                        print(_user);
                      },
                    );
                  },
                ),
                const Text('Customer'),
                Radio(
                  value: Users.Vendor,
                  groupValue: _user,
                  onChanged: (Users value) {
                    setState(
                      () {
                        _user = value;
                        print(_user);
                      },
                    );
                  },
                ),
                const Text('Vendor'),
              ],
            ),
            RoundButton (
              title: 'Register',
              onPressed: () async {
                if(passwordController.text == confirmPassword.text){
                  try {
                    print("Register pressed");
                    await _auth.createUserWithEmailAndPassword(
                        email: emailController.text, password: passwordController.text);
                    addData();
                    print("Signed Up");
                  } on FirebaseAuthException catch (e) {
                    return e.message;
                  }
                }
              },
            ),
            ORWord(),
            GooglePath(
              flatButtonText: 'Sign Up with Google',
              onPressed: () {
                print('Google Sign up API');
              },
            ),
          ],
        ),
      ),
    );
  }
}
