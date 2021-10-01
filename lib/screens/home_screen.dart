import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motor_bike_new/provider/content_provider.dart';
import 'package:motor_bike_new/screens/all_categories_screen.dart';
import 'package:motor_bike_new/screens/all_products_screen.dart';
import 'package:motor_bike_new/screens/bottum_nav_bar_screen.dart';
import 'package:motor_bike_new/screens/searched_vehicles_screen.dart';
import 'package:motor_bike_new/widgets/veichle_recently_item.dart';
import 'package:motor_bike_new/widgets/veichle_type_item.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
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
  var isSearchLoding = false;

  @override
  void didChangeDependencies() {
    if (isInit) {
      final providerData = Provider.of<Contentrovider>(context, listen: false);
      if (providerData.getCatgeroyLList.length == 0) {
        providerData.getCatgeroyRequest().then(
          (_) {
            setState(() {
              loading = false;
              isInit = false;
            });
          },
        );
        if (providerData.getvehicleLList.length == 0)
          providerData.getURecentlyRequest();
      } else {
        setState(() {
          loading = false;
          isInit = false;
        });
      }
      super.didChangeDependencies();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cateData =
        Provider.of<Contentrovider>(context, listen: false).getCatgeroyLList;
    final recentlyAddedData =
        Provider.of<Contentrovider>(context, listen: false).getvehicleLList;
    final height = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: loading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<Contentrovider>(context,
                                              listen: false)
                                          .setBottumIndex(1);

                                      pushNewScreen(
                                        context,
                                        screen: BottumNavBar(),
                                        withNavBar:
                                            false, // OPTIONAL VALUE. True by default.
                                        pageTransitionAnimation:
                                            PageTransitionAnimation.cupertino,
                                      );

                                      // Navigator.of(context).pushAndRemoveUntil(
                                      //   CupertinoPageRoute(
                                      //     builder: (BuildContext context) {
                                      //       return MainScreen();
                                      //     },
                                      //   ),
                                      //   (_) => false,
                                      // );

                                      // Navigator.of(context).pushAndRemoveUntil(
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             MainScreen()),
                                      //     (Route<dynamic> route) => false);
                                    },
                                    child: TextFormField(
                                      enabled: false,
                                      cursorHeight: 25,
                                      keyboardType: TextInputType.text,
                                      autofocus: false,
                                      controller: searchText,
                                      enableInteractiveSelection: false,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                      decoration: InputDecoration(
                                          isDense: true,
                                          hintText: "Search vehicles",
                                          enabled: false,
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding: EdgeInsets.fromLTRB(
                                              15, 10, 15, 10),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.5)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.5)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.5))),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<Contentrovider>(context,
                                              listen: false)
                                          .setBottumIndex(1);

                                      pushNewScreen(
                                        context,
                                        screen: BottumNavBar(),
                                        withNavBar:
                                            false, // OPTIONAL VALUE. True by default.
                                        pageTransitionAnimation:
                                            PageTransitionAnimation.cupertino,
                                      );
                                      //   showLoaderDialog(context);
                                      // setState(() {
                                      //   isSearchLoding = !isSearchLoding;
                                      // });
                                      // Provider.of<Contentrovider>(context,
                                      //         listen: false)
                                      //     .getFiltterRequest()
                                      //     .then((value) {
                                      //   //   Navigator.of(context).pop();
                                      //   if (value &&
                                      //       Provider.of<Contentrovider>(context,
                                      //                   listen: false)
                                      //               .getAllVehicleLList
                                      //               .length !=
                                      //           0) {
                                      //     setState(() {
                                      //       isSearchLoding = !isSearchLoding;
                                      //     });

                                      //     Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) =>
                                      //               SearchedVhiclesScreen()),
                                      //     );
                                      //   } else {
                                      //     Fluttertoast.showToast(
                                      //         msg: "no Item",
                                      //         toastLength: Toast.LENGTH_LONG,
                                      //         gravity: ToastGravity.CENTER,
                                      //         timeInSecForIosWeb: 1,
                                      //         backgroundColor: Colors.white,
                                      //         textColor: Colors.black,
                                      //         fontSize: 16.0);
                                      //     setState(() {
                                      //       isSearchLoding = !isSearchLoding;
                                      //     });
                                      //   }
                                      // });
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                left: BorderSide(
                                                    width: 1,
                                                    color:
                                                        Colors.grey.shade500))),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 8, 10, 7),
                                          child: isSearchLoding
                                              ? SizedBox(
                                                  height: height * 0.07,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                  ))
                                              : Icon(Icons.search_outlined,
                                                  color: Colors.grey.shade500),
                                        )),
                                  )
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
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
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
                            itemCount:
                                cateData.length > 9 ? 9 : cateData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return VeichleTypeItem(
                                viewAll: false,
                                description: cateData[index].description,
                                id: int.parse(cateData[index].id),
                                image: cateData[index].featuerdImage,
                                name: cateData[index].name,
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
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
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

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void searchVeichle(String value) {}
}
