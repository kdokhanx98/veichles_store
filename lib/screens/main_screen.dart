import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motor_bike_new/screens/favourite_screen.dart';
import 'package:motor_bike_new/screens/home_screen.dart';
import 'package:motor_bike_new/screens/search_screen.dart';
import 'package:motor_bike_new/screens/sell_now_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'dart:io' show Platform;

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final bool isAndroid = Platform.isAndroid;
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  bool _hideNavBar = false;

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
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
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      SearchScreen(),
      SellScreen(),
      FavouriteScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(isAndroid ? Icons.home : CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: Color(0xff00B241),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(isAndroid ? Icons.search : CupertinoIcons.search),
        title: ("Find"),
        activeColorPrimary: Color(0xff00B241),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(isAndroid ? Icons.add : CupertinoIcons.add),
        title: ("Sell Now"),
        activeColorPrimary: Color(0xff00B241),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
            isAndroid ? Icons.favorite : CupertinoIcons.square_favorites_alt),
        title: ("Favourite"),
        activeColorPrimary: Color(0xff00B241),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
