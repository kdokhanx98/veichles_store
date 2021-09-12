import 'package:flutter/material.dart';
import 'package:motor_bike_new/widgets/veichle_recently_item.dart';

class ViewAllProudctsScreen extends StatefulWidget {
  @override
  _ViewAllProudctsScreenState createState() => _ViewAllProudctsScreenState();
}

class _ViewAllProudctsScreenState extends State<ViewAllProudctsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Proucts"),
        backgroundColor: Color(0xff00B241),
        backwardsCompatibility: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 15,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return VeichleRecentlyItem(false, index);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
