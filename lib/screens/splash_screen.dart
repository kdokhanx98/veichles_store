import 'package:flutter/material.dart';
import 'package:motor_bike_new/screens/register_screen.dart';

class SplashScreen extends StatefulWidget {
  static String tag = '/ShophopSplash';

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
     Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamedAndRemoveUntil(RegisterScreen.routeName, (route) => false);
       }  );

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.green.shade200,
        width: width + width * 0.4,
        child: Stack(
          children: <Widget>[
            Image.asset("assets/splash_bg_green.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 220,
                    height: 220,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Image.asset(
                      "assets/ars_logo.png",
                     
                      width: 120,
                    ),
                  ),
          
                ],
              ),
            ),
   
          ],
        ),
      ),
    );
  }
}