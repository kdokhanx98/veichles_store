import 'package:flutter/material.dart';
import 'package:motor_bike_new/widgets/veichle_recently_item.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName = '/favourite';
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00B241),
        title: Text("Favorites"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Container(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return VeichleRecentlyItem(true);
              }),
        ),
      ),
    );
  }
}
