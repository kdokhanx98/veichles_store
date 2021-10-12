import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:motor_bike_new/models/user.dart';

import '../api_url.dart';

class AuthProvider with ChangeNotifier {
  String? token;
  String? userEmail;
  String? userNicName;
  String? userDisplayName;
  String? forgetEmail;
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

      if (responseData.containsKey('code')) {
        String masg = responseData["message"];

        Fluttertoast.showToast(
            msg: masg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
      } else {
        token = responseData['token'];
        // userEmail = responseData['user_email'];
        // userNicName = responseData['user_nicename'];
        // userDisplayName = responseData['user_display_name'];

        print(" addedLog $token");
        print(" addedLog $responseData");
      }

      notifyListeners();
      print("--------------------------------");
    } catch (e) {
      print(" addedLog $e");
    }
  }

  Future<bool> getUserToken({String? username, password}) async {
    // check if Token avilable

    final url = Uri.parse(getUserTokenUrl);

    Map<String, String> userData = {
      "username": username!,
      "password": password,
    };

    try {
      final response = await http.post(url, body: userData);

      final responseData = json.decode(response.body);
      log(" getUserToken $responseData");

      if (responseData.containsKey('code')) {
        String masg = responseData["message"];

        Fluttertoast.showToast(
            msg: masg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);

        return false;
      } else {
        token = responseData['token'];
        userEmail = responseData['user_email'];
        userNicName = responseData['user_nicename'];
        userDisplayName = responseData['user_display_name'];

        print(" getUserToken $token");
        print(" getUserToken $responseData");
        return true;
      }
    } catch (e) {
      print("getUserToken $e");
      return false;
    }
  }

  Future<bool> postUpdateUser(
      {String? username, firstName, lastName, email, id}) async {
    // check if Token avilable
    print("username $username");
    print("firstName $firstName");
    print("lastName $lastName");
    print("email $email");
    print("id $id");
    final url = Uri.parse("$postupdateUrl$id");
  
    Map<String, String> userData = {
      "username": username!,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
    };
    Map<String, String> header = {
      "Authorization": "Bearer $token",
    };

    try {
      final response = await http.post(url, body: userData, headers: header);

      final responseData = json.decode(response.body);
      log(" getUserToken $responseData");

      if (responseData.containsKey('code')) {
        String masg = responseData["message"];

        Fluttertoast.showToast(
            msg: masg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);

        return false;
      } else {
        user = User(
            email: responseData['email'],
            firstName: responseData['first_name'],
            id: responseData['id'].toString(),
            lastName: responseData['last_name'],
            link: responseData['link'],
            name: responseData['name'],
            userName: responseData['username']);

        // token = responseData['token'];
        // userEmail = responseData['user_email'];
        // userNicName = responseData['user_nicename'];
        // userDisplayName = responseData['user_display_name'];

        //   print(" getUserToken $token");
        print(" getUserToken $responseData");
        return true;
      }
    } catch (e) {
      print("getUserToken $e");
      return false;
    }
  }

  Future<bool> posetLogin() async {
    // check if Token avilable

    final url = Uri.parse(postLogin);

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.post(url, headers: header);

      final responseData = json.decode(response.body);
      print(" userPostLogin $responseData");

      if (responseData.containsKey('code')) {
        String masg = responseData["message"];

        Fluttertoast.showToast(
            msg: masg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);

        return false;
      } else {
        user = User(
          id: responseData['id'].toString(),
          userName: responseData['username'],
          email: responseData['email'],
          firstName: responseData['firstname'],
          lastName: responseData['lastname'],
          link: "",
          name: "",
        );
        //     print(" addedLog $token");
        print(" userPostLogin $responseData");
        return true;
      }
    } catch (e) {
      print(" userPostLogin $e");
      return false;
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
      if (responseData.containsKey('message')) {
        String masg = responseData["message"];
        Fluttertoast.showToast(
            msg: masg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);

        return false;
      } else {
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

  Future<bool> postForgetPassword({String? email}) async {
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
      if (responseData.containsKey('code')) {
        String masg = responseData["message"];
        Fluttertoast.showToast(
            msg: masg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);

        return false;
      } else {
        forgetEmail = email;
        String masg = responseData["message"];
        Fluttertoast.showToast(
            msg: masg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
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

  Future<bool> postSetNewPassword({String? password, code}) async {
    // check if Token avilable

    final url = Uri.parse(postSetNewPasswordUrl);

    Map<String, String> userData = {
      "email": forgetEmail!,
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
      if (responseData.containsKey('code')) {
        String masg = responseData["message"];
        Fluttertoast.showToast(
            msg: masg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);

        return false;
      } else {
        String masg = responseData["message"];
        Fluttertoast.showToast(
            msg: masg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
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
