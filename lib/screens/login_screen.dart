import 'package:flutter/material.dart';
import 'package:motor_bike_new/provider/auth_provider.dart';
import 'package:motor_bike_new/screens/forget_password_screen.dart';
import 'package:motor_bike_new/screens/main_screen.dart';
import 'package:motor_bike_new/screens/register_screen.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
    static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailControl = TextEditingController();

  TextEditingController passwordControl = TextEditingController();


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
          .getUserToken(
            username: emailControl.text,
            password: passwordControl.text,

            //   context: context
          )
          .then((value) {
            if(value){
             Provider.of<AuthProvider>(context, listen: false).posetLogin().then((value) {
                Navigator.of(context).pop();

               Navigator.of(context).pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false);
             });

                       //   

            }else{
 Navigator.of(context).pop();
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
        child: Center(
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
                "Sign in",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        GestureDetector(
                          onTap: ()=>Navigator.of(context).pushNamed(ForgetPasswordScreen.routeName),
                          child: Text("Forget Password?")),
                      ],)
                    ],
                  ),
                ),
              ),
        SizedBox(height: size.height*0.25,),
               GestureDetector(
                            onTap: () {
                              saveForm(context);
                             // Navigator.of(context).pushNamed(MainScreen.routeName);
                            },
                            child: Container(
                              width: size.width * 0.9,
                              height: size.height * 0.077,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height*0.03,),
                          GestureDetector(
                                                      onTap: ()=>Navigator.of(context).pushNamedAndRemoveUntil(RegisterScreen.routeName, (route) => false),
      
                            child: Text("Sign up" , style: TextStyle(color: Colors.black , fontSize: 16 ,fontWeight: FontWeight.bold),)),
                          SizedBox(height: size.height*0.05,),
      
      
            ],
          ),
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
