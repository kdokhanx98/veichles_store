import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: true,
        backgroundColor: Color(0xff00B241),
        title: Text("Notifications"),
      ),
    );
  }
}
