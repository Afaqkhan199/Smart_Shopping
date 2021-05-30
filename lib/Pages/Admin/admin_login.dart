import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Admin/admin_home.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';

class AdminLogin extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static const String id = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 24.0),
        child: ListView(
          children: <Widget>[
            Hero(
              tag: 'Logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/Logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),

            // TextField(
            //   onChanged: (value) {
            //     //Get user's input
            //   },
            //   decoration: kTextFieldDecoration.copyWith(hintText: 'Email'),
            // ),
            // SizedBox(
            //   height: 15.0,
            // ),
            //Commented the email text box out because there will be one Admin only who will manage everything and his/her password will be created manually in the DB. All he/she will need, is just to enter the password to access the application

            TextField(
              obscureText: true,
              onChanged: (value) {
                //Get user's input
              },
              controller: passwordController,
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter Your Password'),
            ),
            RoundButton(
              title: 'Log In',
              onPressed: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: 'admin@smartshopping.com',
                      password: passwordController.text);
                  if (user != null)
                    Navigator.pushNamed(context, AdminHome.id);
                } on FirebaseAuthException catch (e) {
                  final snackBar = SnackBar(content: Text('Invalid Password'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return e.message;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
