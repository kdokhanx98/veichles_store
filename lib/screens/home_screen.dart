import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motor_bike_new/widgets/veichle_recently_item.dart';
import 'package:motor_bike_new/widgets/veichle_type_item.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchText = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(

      //   backgroundColor: Color(0xff00B241),
      //   title: TextField(
      //     onChanged: (value) {
      //       searchVeichle(value);
      //     },
      //     style: TextStyle(color: Colors.white),
      //     controller: searchText,
      //     decoration: InputDecoration(
      //         hintStyle: TextStyle(color: Colors.white),
      //         hintText: "Search Vehiches",
      //         icon: Icon(
      //           Icons.search,
      //           color: Colors.white,
      //         )),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      onTap: () {},
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
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return VeichleTypeItem();
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
                      onTap: () {},
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
                      itemCount: 8,
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
