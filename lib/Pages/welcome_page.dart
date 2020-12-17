import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Admin/admin_login.dart';
import 'package:fyp_smart_shopping/Pages/login_page.dart';
import 'package:fyp_smart_shopping/Pages/registration_page.dart';
import 'package:fyp_smart_shopping/components/round_button.dart';

class Welcome extends StatefulWidget {
  static const String id = 'welcome_page';
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'Logo',
                  child: Container(
                    child: Image.asset('images/Logo.png'),
                    height: 60,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    'Smart Shopping',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            RoundButton(
              title: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, Login.id);
              },
            ),
            RoundButton(
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, Register.id);
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AdminLogin.id);
              },
              child: Text('Admin Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
