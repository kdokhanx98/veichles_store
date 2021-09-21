import 'package:flutter/material.dart';

import '../constants.dart';

class ForgetPasswordScreen extends StatelessWidget {
    static const routeName = '/ForgetPasswordScreen';

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Forget Password" , style: TextStyle(color: Colors.black),),
        elevation: 0.0,
        leading: IconButton(
         icon: Icon(Icons.arrow_back_ios_new , color: Colors.black,),
         onPressed: ()=>Navigator.of(context).pop(), 
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Please enter your email so we can send  your new password",
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
                                "Send",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                
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
