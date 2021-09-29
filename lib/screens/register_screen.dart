import 'package:flutter/material.dart';
import 'package:motor_bike_new/provider/auth_provider.dart';
import 'package:motor_bike_new/provider/content_provider.dart';
import 'package:motor_bike_new/screens/login_screen.dart';
import 'package:motor_bike_new/screens/main_screen.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailControl = TextEditingController();

  TextEditingController firstNameControl = TextEditingController();

  TextEditingController lastNameControl = TextEditingController();

  TextEditingController passwordControl = TextEditingController();

  TextEditingController confPasswordControl = TextEditingController();

  var isInit = true;

  var loading = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.getToken();
      super.didChangeDependencies();
    }
  }

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
      showLoaderDialog(context);
      Provider.of<AuthProvider>(context, listen: false)
          .postRegister(
            email: emailControl.text,
            password: passwordControl.text,
            firstName: firstNameControl.text, userName: emailControl.text,
            lastName: lastNameControl.text,
            //   context: context
          )
          .then((value) {
            if(value){
              Navigator.of(context).pop();
            Navigator.of(context).pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false);

            }
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Image.asset('assets/ars_logo.jpg'),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              "Sign up",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.44,
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
                                Icons.person,
                                color: kgaryColor,
                                size: 25,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Expanded(
                                child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    onFieldSubmitted: (term) {},
                                    controller: firstNameControl,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(0.0),
                                      border: InputBorder.none,
                                      hintText: "First Name",
                                    ),
                                    validator: (value) {
                                      if ((value!.length < 255) == false ||
                                          value.isEmpty) {
                                        return 'Please enter a valid name';
                                      }
                                      return null;
                                    }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Container(
                          width: size.width * 0.45,
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
                                Icons.person,
                                color: kgaryColor,
                                size: 25,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Expanded(
                                child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.words,
                                    obscureText: false,
                                    onFieldSubmitted: (term) {},
                                    controller: lastNameControl,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(0.0),
                                      border: InputBorder.none,
                                      hintText: "Last Name",
                                    ),
                                    validator: (value) {
                                      if ((value!.length < 255) == false ||
                                          value.isEmpty) {
                                        return 'Please enter a valid name';
                                      }
                                      return null;
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                                controller: emailControl,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0),
                                  border: InputBorder.none,
                                  hintText: "Email Address",
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
                                controller: confPasswordControl,
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
                  ],
                ),
              ),
            ),
        SizedBox(height: size.height*0.07,),
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
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            GestureDetector(
                onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    LoginScreen.routeName, (route) => false),
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
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

  bool isValidEmail(String text) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(text);
  }
}
