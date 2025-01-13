import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_with_phone_screen.dart';
import 'login_screen.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  // String verificationId;

  OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();

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
                        'Verify OTP',
                        style: TextStyle(
                          fontSize: textScaleFactor * 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: srcheight * 0.02),
                      Text(
                        'We have sent an OTP to ${widget.phoneNumber}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: textScaleFactor * 16,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: srcheight * 0.03),
                      Form(
                        child: TextFormField(
                          controller: otpController,
                          decoration: InputDecoration(
                            labelText: 'Enter OTP',
                            hintText: '6-digit OTP',
                            prefixIcon: const Icon(Icons.lock),
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
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(height: srcheight * 0.03),
                      ElevatedButton(
                        onPressed: () {
                          //todo create a final credential

                          final otp = otpController.text.trim();
                          // final credential=PhoneAuthProvider().credential(
                          //     verificationId: widget.phoneNumber,
                            // smsCode:widget.phoneNumberController.text.trim()
                          // );

                          if (otp.isNotEmpty && otp.length == 6) {
                            // Handle OTP verification logic
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("OTP Verified Successfully"),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter a valid 6-digit OTP"),
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
                        child: const Text('Verify'),
                      ),
                      SizedBox(height: srcheight * 0.02),
                      TextButton(
                        onPressed: () {
                          // Resend OTP logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("OTP Resent"),
                            ),
                          );
                        },
                        child: Text(
                          'Resend OTP',
                          style: TextStyle(
                            color: const Color(0xFF6A11CB),
                            fontWeight: FontWeight.bold,
                            fontSize: textScaleFactor * 14,
                          ),
                        ),
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
