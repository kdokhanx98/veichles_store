import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName = '/favourite';
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Favourite Screen")),
    );
  }
}
