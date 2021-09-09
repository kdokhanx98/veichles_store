import 'package:flutter/material.dart';

class SideMenuScreen extends StatelessWidget {
  static const routeName = '/sidemenu';
  const SideMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Side menu Screen")),
    );
  }
}
