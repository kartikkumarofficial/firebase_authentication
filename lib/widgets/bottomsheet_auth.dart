import 'package:firebase_authentication/screens/home_screen.dart';
import 'package:firebase_authentication/screens/login_with_phone_screen.dart';
import 'package:flutter/material.dart';

class BottomSheetOpener {
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select an Option",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Login with Phone Number"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneNumberScreen()));
                  print("Login with Phone Number selected");
                },
              ),
              ListTile(
                leading: Icon(Icons.g_mobiledata),
                title: Text("Continue with Google"),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                  print("Continue with Google selected");
                },
              ),
            ],
          ),
        );
      },
    );
  }
}