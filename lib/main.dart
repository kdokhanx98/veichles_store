import 'package:flutter/material.dart';
import 'package:motor_bike_new/screens/favourite_scree.dart';
import 'package:motor_bike_new/screens/home_screen.dart';
import 'package:motor_bike_new/screens/login_screen.dart';
import 'package:motor_bike_new/screens/main_scree.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      },
    );
  }
}
