import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class text_Storing_page extends StatefulWidget {
  const text_Storing_page({super.key});

  @override
  State<text_Storing_page> createState() => _text_Storing_pageState();
}

class _text_Storing_pageState extends State<text_Storing_page> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var srcheight = MediaQuery.of(context).size.height;
    var srcwidth = MediaQuery.of(context).size.width;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Store text',
          style: TextStyle(fontWeight: FontWeight.bold),
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
                // Text Field
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter something...',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(srcwidth * 0.04),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: srcheight * 0.02, horizontal: srcwidth * 0.04),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.5),
                    //     spreadRadius: 1,
                    //     blurRadius: 5,
                    //     offset: Offset(0, 3),
                    //   ),
                    // ],
                  ),
                ),
                SizedBox(height: srcheight * 0.03),

                // Store Button
                ElevatedButton(
                  onPressed: () {
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
                        "Store",
                        style: TextStyle(
                          fontSize: textScaleFactor * 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


