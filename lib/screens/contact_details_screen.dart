import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetails extends StatelessWidget {
  static const routeName = '/contactDetails';

  _launchCaller(String phone) async {
    final url = "tel:$phone";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: true,
        backgroundColor: Color(0xff00B241),
        title: Text("Contact"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _launchCaller("+1 866 675 2271");
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Phone",
                            style: TextStyle(
                                color: Color(0xFF212121), fontSize: 18),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Color(0xFF212121),
                          )
                        ],
                      ),
                      Text("866-675-2271", style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Divider(),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    // ShEmailScreen().launch(context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Email",
                            style: TextStyle(
                                color: Color(0xFF212121), fontSize: 18),
                          ),
                        ],
                      ),
                      Text(
                        "info@advantageremarketing.com",
                        style:
                            TextStyle(color: Color(0xFF212121), fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Divider()
                    ],
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    // ShEmailScreen().launch(context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Address",
                            style: TextStyle(
                                color: Color(0xFF212121), fontSize: 18),
                          ),
                        ],
                      ),
                      Text(
                        "8187 Ritchie Hwy Pasadena, MD 21122",
                        style:
                            TextStyle(color: Color(0xFF212121), fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Divider()
                    ],
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    // ShEmailScreen().launch(context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Working Time",
                            style: TextStyle(
                                color: Color(0xFF212121), fontSize: 18),
                          ),
                        ],
                      ),
                      Text(
                        "Monday - Friday | 9am - 5pm",
                        style:
                            TextStyle(color: Color(0xFF212121), fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Divider()
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
