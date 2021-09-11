import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  static const routeName = '/contact';
  final emailToCont = TextEditingController();
  final emailCont = TextEditingController();
  final nameCont = TextEditingController();
  final phoneCont = TextEditingController();
  final descriptionCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: true,
        backgroundColor: Color(0xff00B241),
        title: Text("Get in Touch"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: nameCont,
                  enabled: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(fontSize: 16),
                  autofocus: false,
                  decoration: formFieldDecoration("Name"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailCont,
                  enabled: true,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(fontSize: 16),
                  autofocus: false,
                  decoration: formFieldDecoration("Email address"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: phoneCont,
                  enabled: true,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(fontSize: 16),
                  autofocus: false,
                  decoration: formFieldDecoration("Phone number"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: descriptionCont,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 3,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(fontSize: 16),
                  autofocus: false,
                  decoration: formFieldDecoration("Enter your message"),
                ),
                SizedBox(
                  height: 50,
                ),
                MaterialButton(
                  height: 50,
                  minWidth: 150,
                  onPressed: () {
                    print("clicked");
                  },
                  color: Colors.green,
                  child: Text(
                    "Send Message",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

InputDecoration formFieldDecoration(String hintText) {
  return InputDecoration(
    labelText: hintText,
    counterText: "",
    labelStyle: TextStyle(fontSize: 16),
    contentPadding: new EdgeInsets.only(bottom: 2.0),
  );
}
