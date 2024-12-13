import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppColors {

  static const Color primary = Color(0xFF0090422);

  static const Color secondary = Color(0xFF009CF6);
  static const Color primaryDark = Color(0xFF007F3D);
}

class CustomToast {
  static void showSuccess(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showError(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}



class SnackBarHelper {

  static void showSuccessSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Row(
          children: [
            Icon(
              Icons.check_circle, // Tick icon
              color: Colors.white,
              size: 24.0, // Icon ka size
            ),
            SizedBox(width: 8.0), // Text aur icon ke beech thoda space
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),

      backgroundColor: Colors.green, // Success ka color
      duration: Duration(seconds: 3), // Kitna time dikhaye
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Border radius add kiya gaya
      ),

      behavior: SnackBarBehavior.floating, // Floating effect add karne ke liye
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Error SnackBar show karna (optional: isme aap error icon bhi add kar sakte hain)
  static void showErrorSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0), // Padding add kiya gaya
        child: Row(
          children: [
            Icon(
              Icons.error, // Error icon
              color: Colors.white,
              size: 24.0, // Icon ka size
            ),
            SizedBox(width: 8.0), // Text aur icon ke beech thoda space
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.red, // Error ka color
      duration: Duration(seconds: 3), // Kitna time dikhaye
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Border radius add kiya gaya
      ),
      behavior: SnackBarBehavior.floating, // Floating effect add karne ke liye
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  static void showWarningSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.warning, // Warning icon
            color: Colors.white,
            size: 24.0, // Icon ka size
          ),
          SizedBox(width: 8.0), // Text aur icon ke beech thoda space
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.orange, // Warning ka color
      duration: Duration(seconds: 3), // Kitna time dikhaye
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Border radius add kiya gaya
      ),
      behavior: SnackBarBehavior.floating, // Floating effect add karne ke liye

    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }




}
