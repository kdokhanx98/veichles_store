import 'package:flutter/material.dart';
import 'package:motor_bike_new/provider/auth_provider.dart';
import 'package:motor_bike_new/screens/bottum_nav_bar_screen.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class SetNewPasswordScreen extends StatelessWidget {
  static const routeName = '/SetNewPasswordScreen';

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailControl = TextEditingController();
  TextEditingController codeControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  TextEditingController confirmPasswordControl = TextEditingController();

  saveForm(BuildContext context) {
    print('icslck');

    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      print('inVaild');
      return;
    }
    formKey.currentState!.save();
    print("aaaaa");

    if (isValid) {
      Provider.of<AuthProvider>(context, listen: false)
          .postSetNewPassword(
              code: codeControl.text, password: passwordControl.text
              //   context: context
              )
          .then((value) {
        if (value)
          Navigator.of(context).pushNamedAndRemoveUntil(
              BottumNavBar.routeName, (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Set New Password",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Please enter a code and new password",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.09,
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Icon(
                            Icons.lock_outline_rounded,
                            color: kgaryColor,
                            size: 25,
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Expanded(
                            child: TextFormField(
                                textCapitalization: TextCapitalization.words,
                                obscureText: true,
                                onFieldSubmitted: (term) {},
                                controller: passwordControl,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0),
                                  border: InputBorder.none,
                                  hintText: "Password",
                                ),
                                validator: (value) {
                                  if (value!.length < 6) {
                                    return 'Please enter a password greater than 6 characters';
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      width: size.width,
                      height: size.height * 0.09,
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Icon(
                            Icons.lock_outline_rounded,
                            color: kgaryColor,
                            size: 25,
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Expanded(
                            child: TextFormField(
                                textCapitalization: TextCapitalization.words,
                                obscureText: true,
                                onFieldSubmitted: (term) {},
                                controller: confirmPasswordControl,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0),
                                  border: InputBorder.none,
                                  hintText: "Confirm Password",
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Password is not compatible';
                                  }

                                  if (value != passwordControl.text) {
                                    return 'Password is not compatible';
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      width: size.width,
                      height: size.height * 0.09,
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Icon(
                            Icons.email_outlined,
                            color: kgaryColor,
                            size: 25,
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Expanded(
                            child: TextFormField(
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                onFieldSubmitted: (term) {},
                                controller: codeControl,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0),
                                  border: InputBorder.none,
                                  hintText: "Code",
                                ),
                                validator: (value) {
                                  if (isValidEmail(value!) == false ||
                                      (value.length < 255) == false ||
                                      value.isEmpty) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
            ),
            GestureDetector(
              onTap: () {
                saveForm(context);
              },
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.077,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Reset",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  bool isValidEmail(String text) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(text);
  }
}
