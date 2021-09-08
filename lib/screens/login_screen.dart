import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:motor_bike_new/screens/home_screen.dart';
import 'package:motor_bike_new/screens/main_scree.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash_bgg.jpg'),
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              color: Colors.white.withOpacity(0.0),
              child: FlutterLogin(
                navigateBackAfterRecovery: true,
                logo: 'assets/ars_logo_alt.png',
                onLogin: (loginData) {},
                onSignup: (loginData) {},
                onSubmitAnimationCompleted: () {
                  Navigator.of(context)
                      .pushReplacementNamed(MainScreen.routeName);
                },
                onRecoverPassword: (code) {},
                theme: LoginTheme(
                  buttonTheme: LoginButtonTheme(
                    backgroundColor: Color(0xff00B241),
                    highlightColor: Color(0xff00B299),
                  ),
                  primaryColor: Color(0xff00B241),
                  pageColorLight: Colors.transparent,
                  pageColorDark: Colors.transparent,
                  accentColor: Color(0xff00B299),
                  footerBackgroundColor: Color(0xff00B299),
                  cardTheme: CardTheme(color: Colors.green.shade100),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
