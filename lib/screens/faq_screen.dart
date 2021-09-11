import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  static const routeName = '/faq';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: true,
        backgroundColor: Color(0xff00B241),
        title: Text("FAQ"),
      ),
    );
  }
}
