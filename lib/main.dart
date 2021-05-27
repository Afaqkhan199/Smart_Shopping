import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/Admin/admin_home.dart';
import 'package:fyp_smart_shopping/Pages/Admin/admin_login.dart';
import 'package:fyp_smart_shopping/Pages/Customer/customer_home.dart';
import 'package:fyp_smart_shopping/Pages/Customer/customer_search_card.dart';
import 'package:fyp_smart_shopping/Pages/Customer/customer_search_led.dart';
import 'package:fyp_smart_shopping/Pages/Customer/customer_search_charger.dart';
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
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_add_led.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_add_charger.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Products/vendor_add_card.dart';
import 'package:fyp_smart_shopping/Services/flutter_chat.dart';
import 'package:fyp_smart_shopping/Pages/Customer/order_view.dart';
import 'package:fyp_smart_shopping/Pages/Customer/search_results.dart';
import 'package:fyp_smart_shopping/Pages/Customer/cart.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Notifications/notification_page.dart';
import 'package:fyp_smart_shopping/Pages/Vendor/Notifications/select_item.dart';

import 'package:fyp_smart_shopping/Services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SmartShopping());
}

class SmartShopping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Welcome.id,
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
        VendorAddCard.id: (context) => VendorAddCard(),
        VendorAddLed.id: (context) => VendorAddLed(),
        VendorAddCharger.id: (context) => VendorAddCharger(),
        //VendorAddProduct.id: (context) => VendorAddProduct(),
        ChatDetailPage.id: (context) => ChatDetailPage(),
        CustomerSearchLed.id: (context) => CustomerSearchLed(),
        CustomerSearchCharger.id: (context) => CustomerSearchCharger(),
        CustomerSearchCard.id: (context) => CustomerSearchCard(),
        OrderView.id: (context) => OrderView(),
        SearchResults.id: (context) => SearchResults(),
        cart.id: (context) => cart(),
        notification.id: (context) => notification(),
        SelectItem.id: (context) => SelectItem(),
      },
    );
  }
}
