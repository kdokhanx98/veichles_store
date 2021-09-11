import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/notification';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool pushNotification = false;
  bool smsNotification = false;
  bool emailNotification = false;
  String? selectedValue = "English(US)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: true,
        backgroundColor: Color(0xff00B241),
        title: Text("Notifications"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Push Notifications",
                      style: TextStyle(color: Color(0xFF212121), fontSize: 18),
                    ),
                    Switch(
                      value: pushNotification,
                      onChanged: (value) {
                        setState(() {
                          pushNotification = value;
                        });
                      },
                      activeColor: Colors.green,
                    )
                  ],
                ),
                Text(
                  "Get notified when a new vehicle is added.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Divider()
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Email Notifications",
                      style: TextStyle(color: Color(0xFF212121), fontSize: 18),
                    ),
                    Switch(
                      value: emailNotification,
                      onChanged: (value) {
                        setState(() {
                          emailNotification = value;
                        });
                      },
                      activeColor: Colors.green,
                    )
                  ],
                ),
                Text(
                  "Receive notifications on jhon@test.com",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Divider()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
