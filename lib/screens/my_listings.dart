import 'package:flutter/material.dart';
import 'package:motor_bike_new/provider/auth_provider.dart';
import 'package:motor_bike_new/provider/content_provider.dart';
import 'package:motor_bike_new/widgets/my_list_item.dart';
import 'package:provider/provider.dart';

class MyListingsScreen extends StatefulWidget {
  static const routeName = '/MyListeings';
  const MyListingsScreen({Key? key}) : super(key: key);

  @override
  State<MyListingsScreen> createState() => _MyListingsScreenState();
}

class _MyListingsScreenState extends State<MyListingsScreen> {
  @override
  Widget build(BuildContext context) {
    final myListings =
        Provider.of<Contentrovider>(context, listen: false).getMyListings;
    print("length my listings: ${myListings.length}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00B241),
        title: Text("My  Listings"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: myListings.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return MyListItem(true, index);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
