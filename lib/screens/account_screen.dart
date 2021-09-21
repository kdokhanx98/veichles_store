import 'package:flutter/material.dart';
import 'package:motor_bike_new/screens/login_screen.dart';

import '../constants.dart';

class AccountScreen extends StatelessWidget {
      static const routeName = '/AccountScreen';


  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailControl = TextEditingController();
  TextEditingController firstNameControl = TextEditingController();
  TextEditingController lastNameControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  TextEditingController confPasswordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
        
            Text(
              "My Account",
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
                          width: size.width *0.44,
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
                                    textCapitalization: TextCapitalization.words,
                                    obscureText: false,
                                    onFieldSubmitted: (term) {},
                                    controller: emailControl,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(0.0),
                                      border: InputBorder.none,
                                      hintText: "First Name",
                                    ),
                                    validator: (value) {
                                      if (
                                          (value!.length < 255) == false ||
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
                      width: size.width *0.45,
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
                                textCapitalization: TextCapitalization.words,
                                obscureText: false,
                                onFieldSubmitted: (term) {},
                                controller: emailControl,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0),
                                  border: InputBorder.none,
                                  hintText: "Last Name",
                                ),
                                validator: (value) {
                                  if (
                                      (value!.length < 255) == false ||
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
                                  if (value!.length < 6) {
                                    return 'Please enter a password greater than 6 characters';
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
    Spacer(),
             GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            width: size.width * 0.9,
                            height: size.height * 0.077,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "Eidt",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height*0.03,),
                        SizedBox(height: size.height*0.05,),


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
