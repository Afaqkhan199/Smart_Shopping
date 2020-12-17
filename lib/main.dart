import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Admin/admin_home.dart';
import 'package:fyp_smart_shopping/Pages/Admin/admin_login.dart';
import 'package:fyp_smart_shopping/Pages/Customer/customer_home.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_products.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/change_description.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/vendor_change_password.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/vendor_rename.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Settings/vendor_settings.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/vendor_home.dart';
import 'package:fyp_smart_shopping/Pages/login_page.dart';
import 'package:fyp_smart_shopping/Pages/registration_page.dart';
import 'package:fyp_smart_shopping/Pages/welcome_page.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_add_product.dart';
import 'package:fyp_smart_shopping/Services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SmartShopping());
}

class SmartShopping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        home: AuthenticationWrapper(),
        routes: {
          Welcome.id: (context) => Welcome(),
          Login.id: (context) => Login(),
          Register.id: (context) => Register(),
          AdminLogin.id: (context) => AdminLogin(),
          AdminHome.id: (context) => AdminHome(),
          VendorHome.id: (context) => VendorHome(),
          CustomerHome.id: (context) => CustomerHome(),
          VendorSettings.id: (context) => VendorSettings(),
          VendorRename.id: (context) => VendorRename(),
          ChangeDescription.id: (context) => ChangeDescription(),
          VendorChangePassword.id: (context) => VendorChangePassword(),
          VendorProducts.id: (context) => VendorProducts(),
          VendorAddProduct.id: (context) => VendorAddProduct(),
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User>();

    if (firebaseuser!=null) {
      if(ModalRoute.of(context).settings.name != CustomerHome.id)
      Navigator.pushNamed(context, CustomerHome.id);
      return CustomerHome();
    }
    return Welcome();
  }
}
