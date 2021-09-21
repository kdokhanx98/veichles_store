import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:motor_bike_new/screens/contact_details_screen.dart';
import 'package:motor_bike_new/screens/contact_us_screen.dart';
import 'package:motor_bike_new/screens/faq_screen.dart';
import 'package:motor_bike_new/screens/favourite_screen.dart';
import 'package:motor_bike_new/screens/forget_password_screen.dart';
import 'package:motor_bike_new/screens/home_screen.dart';
import 'package:motor_bike_new/screens/main_screen.dart';
import 'package:motor_bike_new/screens/search_screen.dart';
import 'package:motor_bike_new/screens/sell_now_screen.dart';
import 'package:motor_bike_new/screens/settings_screen.dart';
import 'package:motor_bike_new/screens/side_menu_screen.dart';
import 'package:motor_bike_new/screens/vehicle_detail.dart';
import 'package:provider/provider.dart';
import 'provider/auth_provider.dart';
import 'provider/content_provider.dart';
import 'screens/location_screen.dart';
import 'screens/login_screen.dart';
import 'screens/my_listings.dart';
import 'screens/register_screen.dart';

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
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
   statusBarColor: Colors.white, // Color for Android
   statusBarBrightness: Brightness.dark // Dark == white status bar -- for IOS.
));
    return MultiProvider(
         providers: [
        ListenableProvider<AuthProvider>(create: (_) => AuthProvider()),
        ListenableProvider<Contentrovider>(create: (_) => Contentrovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ARS',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          appBarTheme: AppBarTheme(
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            brightness: Brightness.light,
    
          )
        ),
        routes: {
          ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          "/": (context) => MainScreen(),
          FavouriteScreen.routeName: (context) => FavouriteScreen(),
          SearchScreen.routeName: (context) => SearchScreen(),
          SellScreen.routeName: (context) => SellScreen(),
          SideMenuScreen.routeName: (context) => SideMenuScreen(),
          VehicleDetail.routeName: (context) => VehicleDetail(),
          ContactUs.routeName: (context) => ContactUs(),
          ContactDetails.routeName: (context) => ContactDetails(),
          SettingsScreen.routeName: (context) => SettingsScreen(),
          FAQScreen.routeName: (context) => FAQScreen(),
          GetLocation.routeName: (context) => GetLocation(),
          MyListingsScreen.routeName: (context) => MyListingsScreen(),
        },
      ),
    );
  }
}
