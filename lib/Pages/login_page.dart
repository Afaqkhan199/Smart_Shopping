import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Services/auth.dart';
import 'package:fyp_smart_shopping/components/constants.dart';
import 'package:fyp_smart_shopping/components/google_path.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';
import 'package:fyp_smart_shopping/components/or_formatting.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/vendor_home.dart';
import 'package:fyp_smart_shopping/Pages/Customer/customer_home.dart';
import 'package:provider/provider.dart';

enum Users { Customer, Vendor }

class Login extends StatefulWidget {
  static const String id = 'login_page';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Users _user = Users.Customer;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                height: 200.0,
                child: Image.asset('images/Logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              controller: emailController,
              onChanged: (value) {
                //Get user's input
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Email'),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              onChanged: (value) {
                //Get user's input
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Password'),
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
                      },
                    );
                  },
                ),
                const Text('Vendor'),
              ],
            ),
            RoundButton(
              title: 'Log In',
              onPressed: () {
                context
                    .read<AuthService>()
                    .signIn(emailController.text, passwordController.text);
              },
            ),
            ORWord(),
            GooglePath(
              flatButtonText: 'Sign in with Google',
              onPressed: () {
                print('Google log in API');
              },
            ),
          ],
        ),
      ),
    );
  }
}
