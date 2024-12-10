import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Models/login.dart';



class Sharedprefrence {


  Future<void> savedata(User responsne) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = jsonEncode(responsne.toJson());
    prefs.setString("Login data", data);
    print("Save data in shared successfully");
  }

  Future<void> getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? json= prefs.getString("Login data");
   if(json!=null)
     {
       User response = User.fromJson(jsonDecode(json));
        UserData.setUserData(response.userName.toString(), response.userId.toString(), response.userEmail.toString(), response.userType.toString(), response.userPassword);
        print("username: ${response.userName.toString()}");
       print("code: ${response.userId.toString()}");
     }
  }
}


class UserData {
  static String? username;
  static String? empCode;
  static String? email;
  static String? usertype;
  static String? password;
  static void setUserData(String name, String code, String emails, String usertypes, String passwords) {
    username = name;
    empCode = code;
    email =emails;
    usertype =usertypes;
    password =passwords;
  }

  static void clearUserData() {
    username = null;
    empCode = null;
    email = null;
    usertype =null;
  }
}

