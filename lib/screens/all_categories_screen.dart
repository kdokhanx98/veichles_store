import 'package:flutter/material.dart';
import 'package:motor_bike_new/widgets/veichle_type_item.dart';

class ViewAllCategoriesScreen extends StatefulWidget {
  const ViewAllCategoriesScreen({Key? key}) : super(key: key);

  @override
  _ViewAllCategoriesScreenState createState() =>
      _ViewAllCategoriesScreenState();
}

class _ViewAllCategoriesScreenState extends State<ViewAllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Categories"),
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
                    itemCount: 6,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return VeichleTypeItem(
                        viewAll: true,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
