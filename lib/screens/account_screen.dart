import 'package:flutter/material.dart';
import 'package:motor_bike_new/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'bottum_nav_bar_screen.dart';

class AccountScreen extends StatefulWidget {
  static const routeName = '/AccountScreen';

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailControl = TextEditingController();

  TextEditingController userNameControl = TextEditingController();

  TextEditingController firstNameControl = TextEditingController();

  TextEditingController lastNameControl = TextEditingController();

  TextEditingController passwordControl = TextEditingController();

  TextEditingController confPasswordControl = TextEditingController();

  bool firstTime = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<AuthProvider>(context, listen: false).user!;
    if (firstTime) {
      emailControl.text = user.email;
      firstNameControl.text = user.firstName;
      lastNameControl.text = user.lastName;
      userNameControl.text = user.userName;
      setState(() {
        firstTime = !firstTime;
      });
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
            .postUpdateUser(
                email: user.userName,
                firstName: firstNameControl.text,
                id: user.id,
                lastName: lastNameControl.text,
                username: userNameControl.text)
            .then((value) {
          if (value) {
            Provider.of<AuthProvider>(context, listen: false)
                .posetLogin()
                .then((value) {
              Navigator.of(context).pop();

              Navigator.of(context).pushNamedAndRemoveUntil(
                  BottumNavBar.routeName, (route) => false);
            });

            //

          } else {
            Navigator.of(context).pop();
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backwardsCompatibility: true,
        backgroundColor: Color(0xff00B241),
        title: Text("My Account"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.05,
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
                    // Container(
                    //   width: size.width,
                    //   height: size.height * 0.09,
                    //   decoration: BoxDecoration(
                    //     color: kBackgroundColor,
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         width: size.width * 0.03,
                    //       ),
                    //       Icon(
                    //         Icons.email_outlined,
                    //         color: kgaryColor,
                    //         size: 25,
                    //       ),
                    //       SizedBox(
                    //         width: size.width * 0.02,
                    //       ),
                    //       Expanded(
                    //         child: TextFormField(
                    //             textCapitalization: TextCapitalization.words,
                    //             obscureText: false,
                    //             onFieldSubmitted: (term) {},
                    //             controller: userNameControl,
                    //             decoration: InputDecoration(
                    //               contentPadding: EdgeInsets.all(0.0),
                    //               border: InputBorder.none,
                    //               hintText: "User Name",
                    //             ),
                    //             validator: (value) {
                    //               if (isValidEmail(value!) == false ||
                    //                   (value.length < 255) == false ||
                    //                   value.isEmpty) {
                    //                 return 'Please enter a valid email';
                    //               }
                    //               return null;
                    //             }),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: size.height * 0.02,
                    // ),

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
                    // Container(
                    //   width: size.width,
                    //   height: size.height * 0.09,
                    //   decoration: BoxDecoration(
                    //     color: kBackgroundColor,
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         width: size.width * 0.03,
                    //       ),
                    //       Icon(
                    //         Icons.lock_outline_rounded,
                    //         color: kgaryColor,
                    //         size: 25,
                    //       ),
                    //       SizedBox(
                    //         width: size.width * 0.02,
                    //       ),
                    //       Expanded(
                    //         child: TextFormField(
                    //             textCapitalization: TextCapitalization.words,
                    //             obscureText: true,
                    //             onFieldSubmitted: (term) {},
                    //             controller: passwordControl,
                    //             decoration: InputDecoration(
                    //               contentPadding: EdgeInsets.all(0.0),
                    //               border: InputBorder.none,
                    //               hintText: "Password",
                    //             ),
                    //             validator: (value) {
                    //               if (value!.length < 6) {
                    //                 return 'Please enter a password greater than 6 characters';
                    //               }
                    //             }),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: size.height * 0.02,
                    // ),
                    // Container(
                    //   width: size.width,
                    //   height: size.height * 0.09,
                    //   decoration: BoxDecoration(
                    //     color: kBackgroundColor,
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         width: size.width * 0.03,
                    //       ),
                    //       Icon(
                    //         Icons.lock_outline_rounded,
                    //         color: kgaryColor,
                    //         size: 25,
                    //       ),
                    //       SizedBox(
                    //         width: size.width * 0.02,
                    //       ),
                    //       Expanded(
                    //         child: TextFormField(
                    //             textCapitalization: TextCapitalization.words,
                    //             obscureText: true,
                    //             onFieldSubmitted: (term) {},
                    //             controller: confPasswordControl,
                    //             decoration: InputDecoration(
                    //               contentPadding: EdgeInsets.all(0.0),
                    //               border: InputBorder.none,
                    //               hintText: "Confirm Password",
                    //             ),
                    //             validator: (value) {
                    //               if (value!.length < 6) {
                    //                 return 'Please enter a password greater than 6 characters';
                    //               }
                    //             }),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Spacer(),
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
                    "Edit",
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
