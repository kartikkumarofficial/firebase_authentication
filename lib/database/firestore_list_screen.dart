import 'package:firebase_authentication/screens/text_store..dart';
import 'package:flutter/material.dart ';
import 'package:firebase_authentication/database/firestore_list_screen.dart';
import 'package:firebase_authentication/screens/home_screen.dart';
import 'package:firebase_authentication/screens/signup_screen.dart';
import 'package:firebase_authentication/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_authentication/widgets/bottomsheet_auth.dart';
import 'package:firebase_authentication/services/google_sign_in.dart';
import 'package:firebase_database/firebase_database.dart';

class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({super.key});

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
  @override
  Widget build(BuildContext context) {
    var srcheight = MediaQuery.of(context).size.height;
    var srcwidth = MediaQuery.of(context).size.width;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final auth = FirebaseAuth.instance;
    final ref = FirebaseDatabase.instance.ref('Post');
    final searchFilter = TextEditingController();
    final editController = TextEditingController();






    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Store Data FS ',
          style: TextStyle(
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF6A11CB),
      ),
      body: Container(
        width: srcwidth,
        height: srcheight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6A11CB),
              Color(0xFF2575FC),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: srcwidth * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text(
                  "Welcome to Home Page",
                  style: TextStyle(
                    fontSize: textScaleFactor * 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: srcheight * 0.03),

                // Button to Store Text
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => text_Storing_page(),));
                    // Implement your logic for storing text
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: srcwidth * 0.15, vertical: srcheight * 0.015),
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6A11CB),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(srcwidth * 0.04),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.text_fields, size: 28),
                      SizedBox(width: srcwidth * 0.03),
                      Text(
                        "Store Text",
                        style: TextStyle(
                          fontSize: textScaleFactor * 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: srcheight * 0.03),

                // Button to Store Image
                ElevatedButton(
                  onPressed: () {
                    // Implement your logic for storing images
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: srcwidth * 0.15, vertical: srcheight * 0.015),
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6A11CB),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(srcwidth * 0.04),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.image, size: 28),
                      SizedBox(width: srcwidth * 0.03),
                      Text(
                        "Store Image",
                        style: TextStyle(
                          fontSize: textScaleFactor * 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: srcheight * 0.05),

                // Footer Text

              ],
            ),
          ),
        ),
      ),
    );
  }
}

