import 'package:flutter/material.dart';
import 'package:motor_bike_new/provider/content_provider.dart';
import 'package:motor_bike_new/widgets/veichle_type_item.dart';
import 'package:provider/provider.dart';

class ViewAllCategoriesScreen extends StatefulWidget {
  const ViewAllCategoriesScreen({Key? key}) : super(key: key);

  @override
  _ViewAllCategoriesScreenState createState() =>
      _ViewAllCategoriesScreenState();
}

class _ViewAllCategoriesScreenState extends State<ViewAllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
        final cateData = Provider.of<Contentrovider>(context, listen: false).getCatgeroyLList;

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
                    itemCount: cateData.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:VeichleTypeItem(
                          viewAll: true,
                          description: cateData[index].description,
                          id: int.parse( cateData[index].id),
                          image:cateData[index].featuerdImage ,name: cateData[index].name,
                        ),
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
