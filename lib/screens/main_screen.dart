import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motor_bike_new/screens/contact_details_screen.dart';
import 'package:motor_bike_new/screens/contact_us_screen.dart';
import 'package:motor_bike_new/screens/faq_screen.dart';
import 'package:motor_bike_new/screens/favourite_screen.dart';
import 'package:motor_bike_new/screens/home_screen.dart';
import 'package:motor_bike_new/screens/search_screen.dart';
import 'package:motor_bike_new/screens/sell_now_screen.dart';
import 'package:motor_bike_new/screens/settings_screen.dart';
import 'package:motor_bike_new/screens/side_menu_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'dart:io' show Platform;

import 'my_listings.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final bool isAndroid = Platform.isAndroid;
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _key,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff00B241),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child:
                        Image.asset('assets/ic_user.png', width: width * 0.2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Faisal Akram",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                              color: Colors.blue.shade900, fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            getDrawerItem(Icons.account_circle_outlined, "Account",
                callback: () {
              print("account clicked");
            }),
            getDrawerItem(
                Icons.notification_important_outlined, "Notifications",
                callback: () {
              Navigator.popAndPushNamed(context, SettingsScreen.routeName);
            }),
            getDrawerItem(Icons.chat_bubble_outline, "Get in Touch",
                callback: () {
              Navigator.popAndPushNamed(context, ContactUs.routeName);
            }),
            getDrawerItem(Icons.contact_page_outlined, "Contact Details",
                callback: () {
              Navigator.popAndPushNamed(context, ContactDetails.routeName);
            }),
            getDrawerItem(Icons.help_outline, "FAQ", callback: () {
              Navigator.popAndPushNamed(context, FAQScreen.routeName);
            }),
            getDrawerItem(Icons.help_outline, "FAQ", callback: () {
              Navigator.popAndPushNamed(context, FAQScreen.routeName);
            }),
            getDrawerItem(Icons.help_outline, "My Listings", callback: () {
              Navigator.popAndPushNamed(context, MyListingsScreen.routeName);
            }),
            SizedBox(height: height * 0.2),
            Center(
              child: Column(
                children: [
                  Divider(color: Color(0xFFeaeaea), height: 1),
                  SizedBox(height: height * 0.03),
                  Container(
                    child: Image.asset('assets/ars.png', width: width * 0.4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: false, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style15, // Choose the nav bar style with this property.
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      SearchScreen(),
      SellScreen(),
      FavouriteScreen(),
      SideMenuScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        inactiveIcon: Icon(Icons.home_outlined),
        activeColorPrimary: Color(0xff00B241),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.find_in_page),
        title: ("Find"),
        inactiveIcon: Icon(Icons.find_in_page_outlined),
        activeColorPrimary: Color(0xff00B241),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          isAndroid ? Icons.add : CupertinoIcons.add,
          color: Colors.white,
        ),
        title: ("Sell Now"),
        activeColorPrimary: Color(0xff00B241),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: ("Liked"),
        inactiveIcon: Icon(Icons.favorite_outline),
        activeColorPrimary: Color(0xff00B241),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.menu_outlined),
        title: ("More"),
        activeColorSecondary: Color(0xff00B241),
        onPressed: (context) {
          _key.currentState!.openDrawer();
        },
        activeColorPrimary: Color(0xff00B241),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}

Widget getDrawerItem(IconData? icon, String itemName,
    {VoidCallback? callback}) {
  return InkWell(
    onTap: callback,
    child: Container(
      color: Colors.transparent,
      padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
      child: Row(
        children: <Widget>[
          Icon(icon, size: 20),
          SizedBox(width: 20),
          Text(
            itemName,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
