import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_authentication/widgets/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool loading = false;

  FirebaseAuth _auth = FirebaseAuth.instance ;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  void login() async{
    setState(() {
      loading=true;
    });
    try {
      await _auth
          .createUserWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString()).then((value)
      {
        setState(() {
          loading=false;
        });
      }).onError((error, stackTrace) {
        Utils().toastMessage(error.toString());
        setState(() {
          loading=false;
        });
      },);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User registered successfully')),
      );
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
      //Todo make this navigator such that if success then navigates back to login screen else remains on signup just add flag if else
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

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
          child: Column(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: srcwidth * 0.08,
                      right: srcwidth * 0.08,
                      top: srcwidth * 0.1,
                    ),
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
                              'Create Account',
                              style: TextStyle(
                                fontSize: textScaleFactor * 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: srcheight * 0.01),
                            Text(
                              'Sign up to get started',
                              style: TextStyle(
                                fontSize: textScaleFactor * 16,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: srcheight * 0.05),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [

                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Email is required";
                                      }
                                      return null;
                                    },
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      hintText: 'Enter your email',
                                      prefixIcon: const Icon(Icons.email_outlined),
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
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(height: srcheight * 0.02),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Password is required";
                                      }
                                      return null;
                                    },
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      hintText: 'Enter your password',
                                      prefixIcon: const Icon(Icons.lock_outline),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isPasswordVisible = !_isPasswordVisible;
                                          });
                                        },
                                      ),
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
                                    obscureText: !_isPasswordVisible,
                                  ),
                                  SizedBox(height: srcheight * 0.02),
                                ],
                              ),
                            ),
                            SizedBox(height: srcheight * 0.01),
                            SizedBox(height: srcheight * 0.03),
                            Container(
                              width: srcwidth*0.7,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    login();
                                    
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF6A11CB),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: srcwidth * 0.2,
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
                                child: Center(
                                  child:loading? CircularProgressIndicator(
                                    strokeWidth: 3,
                                    valueColor:AlwaysStoppedAnimation<Color>(Colors.white) ,):
                                  Text('Sign Up'),),
                              ),
                            ),
                            SizedBox(height: srcheight * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: textScaleFactor * 14,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push
                                      (context, MaterialPageRoute
                                      (builder: (context) => LoginScreen(),));
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: const Color(0xFF6A11CB),
                                      fontWeight: FontWeight.bold,
                                      fontSize: textScaleFactor * 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: srcheight * 0.01),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
