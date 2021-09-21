import 'package:flutter/material.dart';

import '../constants.dart';

class Test1 extends StatefulWidget {

  @override
  _Test1State createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    return  Container(
    color: Colors.transparent,
    height: 56,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new FlatButton.icon(
          icon: Icon(Icons.arrow_back_ios),
          label: Text('Show Address'),
          textColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          onPressed: () {
            getUserLocation();
          },
        ),
      ],
    ),
  )
 ;
  }
  getUserLocation() async {
    markers.values.forEach((value) async {
  print(value.position);
  setState(() {
        locationPosition =value.position;

  });
 
    Navigator.of(context).pop();
    });
  }

}