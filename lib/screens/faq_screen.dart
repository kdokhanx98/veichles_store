import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  static const routeName = '/faq';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: true,
        backgroundColor: Color(0xff00B241),
        title: Text("FAQ"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
            children: <Widget>[
              ExpansionTile(
                title: getTitle("How to sell your vehicle?"),
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 17, right: 17, top: 5, bottom: 10),
                              child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
                        ],
                      )),
                ],
              ),
              ExpansionTile(
                title: getTitle("Where to find the VIN?"),
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 17, right: 17, top: 5, bottom: 10),
                            child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: getTitle("How to find the right vehicle?"),
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 17, right: 17, top: 5, bottom: 10),
                            child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: getTitle("How long will it take?"),
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 17, right: 17, top: 5, bottom: 10),
                            child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat"))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}

Widget getTitle(String titleName) {
  return Text(
    titleName,
    style: TextStyle(color: Color(0xFF212121), fontSize: 18),
  );
}
