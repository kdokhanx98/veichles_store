import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:motor_bike_new/screens/all_products_screen.dart';
import 'package:motor_bike_new/screens/contact_details_screen.dart';
import 'package:motor_bike_new/screens/contact_us_screen.dart';
import 'package:motor_bike_new/screens/faq_screen.dart';
import 'package:motor_bike_new/screens/favourite_screen.dart';
import 'package:motor_bike_new/screens/home_screen.dart';
import 'package:motor_bike_new/screens/login_screen.dart';
import 'package:motor_bike_new/screens/main_screen.dart';
import 'package:motor_bike_new/screens/search_screen.dart';
import 'package:motor_bike_new/screens/sell_now_screen.dart';
import 'package:motor_bike_new/screens/settings_screen.dart';
import 'package:motor_bike_new/screens/side_menu_screen.dart';
import 'package:motor_bike_new/screens/vehicle_detail.dart';

void main() {
  runApp(MyApp());
}

Future changeStatusColor() async {
  await FlutterStatusbarcolor.setStatusBarColor(Color(0xff00B241));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    changeStatusColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ARS',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: LoginScreen(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        MainScreen.routeName: (context) => MainScreen(),
        FavouriteScreen.routeName: (context) => FavouriteScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
        SellScreen.routeName: (context) => SellScreen(),
        SideMenuScreen.routeName: (context) => SideMenuScreen(),
        VehicleDetail.routeName: (context) => VehicleDetail(),
        ContactUs.routeName: (context) => ContactUs(),
        ContactDetails.routeName: (context) => ContactDetails(),
        SettingsScreen.routeName: (context) => SettingsScreen(),
        FAQScreen.routeName: (context) => FAQScreen(),
        ViewAllProudctsScreen.routeName: (context) => ViewAllProudctsScreen(),
      },
    );
  }
}
