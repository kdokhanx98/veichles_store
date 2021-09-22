import 'package:flutter/material.dart';
import 'package:motor_bike_new/provider/content_provider.dart';
import 'package:motor_bike_new/widgets/veichle_recently_item.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName = '/favourite';
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recentlyAddedData =
        Provider.of<Contentrovider>(context, listen: false).getvehicleLList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00B241),
        title: Text("Favorites"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: recentlyAddedData.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return VeichleRecentlyItem(true, index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
