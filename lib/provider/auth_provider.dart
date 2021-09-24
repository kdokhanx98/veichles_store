import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:motor_bike_new/models/user.dart';

import '../api_url.dart';

class AuthProvider with ChangeNotifier {
  String? token;
  User? user;
  Future<void> getToken() async {
    // check if Token avilable

    final url = Uri.parse(getTokenUrl);

    Map<String, String> userData = {
      "username": "mobileapp",
      "password": "la1qzyxb&at0t)IvTugEJ1PK",
    };

    try {
      final response = await http.post(url, body: userData);

      final responseData = json.decode(response.body);

      token = responseData['token'];
      print(" addedLog $token");

      print(" addedLog $responseData");

      notifyListeners();
      print("--------------------------------");
    } catch (e) {
      print(" addedLog $e");
    }
  }

  Future<bool> postRegister(
      {String? userName, email, password, lastName, firstName}) async {
    // check if Token avilable

    final url = Uri.parse(postResgisterUrl);

    Map<String, String> userData = {
      "username": userName!,
      "email": email!,
      "first_name": firstName,
      "last_name": lastName,
      "password": password,
    };

    Map<String, String> header = {
      "Authorization": "Bearer $token",
    };

    try {
      final response = await http.post(url, headers: header, body: userData);


      final responseData = json.decode(response.body);
            print(" addedLog $responseData");
      if(responseData.containsKey('message')){
        String masg = responseData["message"];
Fluttertoast.showToast(
        msg: masg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0
    );

    return false;
      }else{
     user = User(
          email: responseData['email'],
          firstName: responseData['first_name'],
          id: responseData['id'].toString(),
          lastName: responseData['last_name'],
          link: responseData['link'],
          name: responseData['name'],
          userName: responseData['username']);
      }
 

      print(" addedLog $token");

      print(" addedLog $responseData");

      notifyListeners();
      print("--------------------------------");

      return true;
    } catch (e) {
      print(" addedLog $e");
          return false;

    }
  }


  Future<bool> postForgetPassword(
      {String? email}) async {
    // check if Token avilable

    final url = Uri.parse(postForgetPasswordUrl);

    Map<String, String> userData = {
      "email": email!,
    };

    Map<String, String> header = {
      "Authorization": "Bearer $token",
    };

    try {
      final response = await http.post(url, headers: header, body: userData);


      final responseData = json.decode(response.body);
            print(" addedLog $responseData");
      if(responseData.containsKey('code')){
        String masg = responseData["message"];
Fluttertoast.showToast(
        msg: masg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0
    );

    return false;
      }else{
          String masg = responseData["message"];
Fluttertoast.showToast(
        msg: masg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0
    );
 

      }
      print(" addedLog $token");

      print(" addedLog $responseData");

      notifyListeners();
      print("--------------------------------");

      return true;
    } catch (e) {
      print(" addedLog $e");
          return false;

    }
  }

  Future<bool> postSetNewPassword(
      {String? email, password , code}) async {
    // check if Token avilable

    final url = Uri.parse(postSetNewPasswordUrl);

    Map<String, String> userData = {
      "email": email!,
      "password": password!,
      "code": code!,
    };

    Map<String, String> header = {
      "Authorization": "Bearer $token",
    };

    try {
      final response = await http.post(url, headers: header, body: userData);


      final responseData = json.decode(response.body);
            print(" addedLog $responseData");
      if(responseData.containsKey('code')){
        String masg = responseData["message"];
Fluttertoast.showToast(
        msg: masg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0
    );

    return false;
      }else{
          String masg = responseData["message"];
Fluttertoast.showToast(
        msg: masg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0
    );
 

      }
      print(" addedLog $token");

      print(" addedLog $responseData");

      notifyListeners();
      print("--------------------------------");

      return true;
    } catch (e) {
      print(" addedLog $e");
          return false;

    }
  }
}
