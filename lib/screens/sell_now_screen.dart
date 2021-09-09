import 'package:flutter/material.dart';

class SellScreen extends StatelessWidget {
  static const routeName = '/sell';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00B241),
        title: Text("Add Vehicle"),
      ),
      body: Center(child: Text("Sell Now Screen")),
    );
  }
}
