import 'package:flutter/material.dart';
import 'package:motor_bike_new/constants.dart';
import 'package:motor_bike_new/provider/content_provider.dart';
import 'package:motor_bike_new/widgets/all_veichel_item.dart';
import 'package:provider/provider.dart';

class SearchedVhiclesScreen extends StatelessWidget {
  static const routeName = '/SearchedVhiclesScreen';

  const SearchedVhiclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getAllData = Provider.of<Contentrovider>(context).getAllVehicleLList;
    print("aaaaa ${getAllData.length}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Searched Vehicles"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Container(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: getAllData.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return AllVeichleItem(false, index);
                }),
          ),
        ),
      ),
    );
  }
}
