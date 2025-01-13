import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'otp_screen.dart';

import 'package:flutter/material.dart';

class PhoneNumberScreen extends StatefulWidget {

  PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  // final String phoneNumber;
  bool loading = false;

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var srcheight = MediaQuery.of(context).size.height;
    var srcwidth = MediaQuery.of(context).size.width;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              child: Card(
                elevation: 10,
                shadowColor: Colors.black45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(srcwidth * 0.05),
                ),
                child: Padding(
                  padding: EdgeInsets.all(srcwidth * 0.05),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: srcheight * 0.02),
                      Text(
                        'Enter Your Phone Number',
                        style: TextStyle(
                          fontSize: textScaleFactor * 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: srcheight * 0.02),
                      Form(
                        child: TextFormField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            hintText: 'Enter your phone number',
                            prefixIcon: const Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(srcwidth * 0.04),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(srcwidth * 0.04),
                              borderSide: const BorderSide(
                                color: Colors.blueAccent,
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      SizedBox(height: srcheight * 0.03),
                      ElevatedButton(
                        onPressed: () {
                          // final phoneNumber = phoneNumberController.text.trim();
                          auth.verifyPhoneNumber(
                              phoneNumber: phoneNumberController.text.trim(),
                              verificationCompleted: (_){},
                              verificationFailed: (e){
                                Utils().toastMessage(e.toString());
                              },
                              codeSent: (String phoneNumber, int? token){
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                    OtpScreen(
                                        phoneNumber: phoneNumberController.text.trim()),));

                              },
                              codeAutoRetrievalTimeout:(e){
                                Utils().toastMessage(e.toString());
                              } );





                          if (phoneNumber.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpScreen(phoneNumber: phoneNumber),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter a valid phone number"),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6A11CB),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: srcwidth * 0.3,
                            vertical: srcheight * 0.02,
                          ),
                          textStyle: TextStyle(
                            fontSize: textScaleFactor * 18,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(srcwidth * 0.04),
                          ),
                          elevation: 5,
                        ),
                        child: const Text('Next'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

