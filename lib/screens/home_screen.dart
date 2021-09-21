import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motor_bike_new/provider/content_provider.dart';
import 'package:motor_bike_new/screens/all_categories_screen.dart';
import 'package:motor_bike_new/screens/all_products_screen.dart';
import 'package:motor_bike_new/widgets/veichle_recently_item.dart';
import 'package:motor_bike_new/widgets/veichle_type_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchText = TextEditingController();
  bool isSearching = false;

   var isInit = true;
  var loading = true;

  @override
  void didChangeDependencies() {
    if (isInit) {

   final providerData = Provider.of<Contentrovider>(context, listen: false);
        if ( true) {
          providerData
                  .getCatgeroyRequest(
                    )
                  .then(
                (_) {
                  setState(() {
                    loading = false;
                        isInit = false;

                  });
                },
              );

               providerData
                  .getURecentlyRequest();

    }
    super.didChangeDependencies();
  }
  }

  @override
  Widget build(BuildContext context) {
    final cateData = Provider.of<Contentrovider>(context, listen: false).getCatgeroyLList;
    final recentlyAddedData = Provider.of<Contentrovider>(context, listen: false).getvehicleLList;
    final height = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child:loading?Center(child: CircularProgressIndicator()) : SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  print('done');
                  // ShSearchScreen().launch(context);
                },
                child: Container(
                    color: Color(0xff00B241),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 14, right: 14, top: 20, bottom: 20),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: <Widget>[
                            TextFormField(
                              enabled: true,
                              cursorHeight: 25,
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              controller: searchText,
                              textCapitalization: TextCapitalization.words,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              decoration: InputDecoration(
                                  isDense: true,
                                  hintText: "Search vehicles",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 10, 15, 10),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                            width: 1,
                                            color: Colors.grey.shade500))),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 8, 10, 7),
                                  child: Icon(Icons.search_outlined,
                                      color: Colors.grey.shade500),
                                ))
                          ],
                        ))),
              ),
              // this is type of veichles section
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Type of Vehicles",
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (context) {
                          return ViewAllCategoriesScreen();
                        }));
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 8.0,
                ),
                child: Container(
                  height: height * 0.35,
                  margin: EdgeInsets.only(top: 0),
                  alignment: Alignment.topLeft,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: cateData.length>9? 9:cateData.length ,
                      itemBuilder: (BuildContext context, int index) {
                        return VeichleTypeItem(
                          viewAll: false,
                          description: cateData[index].description,
                          id: int.parse( cateData[index].id),
                          image:cateData[index].featuerdImage ,name: cateData[index].name,
                        );
                      }),
                ),
              ),

              // this is recently added veichles section
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Recently Added",
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (context) {
                          return ViewAllProudctsScreen();
                        }));
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: recentlyAddedData.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return VeichleRecentlyItem(false, index);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void searchVeichle(String value) {}
}
