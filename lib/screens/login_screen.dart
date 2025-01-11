import 'package:firebase_authentication/screens/home_screen.dart';
import 'package:firebase_authentication/screens/signup_screen.dart';
import 'package:firebase_authentication/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  bool loading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  final _auth = FirebaseAuth.instance ;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  void login(){
    setState(() {
      loading=true;

    });
    _auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(),));
      setState(() {
        loading=false;

      });
      
        },).onError((error,stackTrace){
      Utils().toastMessage(error.toString());
      setState(() {
        loading=false;

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    var srcheight = MediaQuery.of(context).size.height;
    var srcwidth = MediaQuery.of(context).size.width;
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },

      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: srcwidth,
            height: srcheight,

            decoration:  BoxDecoration(
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
                        top: srcwidth * 0.5,
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
                                'Welcome Back!',
                                style: TextStyle(
                                  fontSize: textScaleFactor * 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: srcheight * 0.01),
                              Text(
                                'Login to continue',
                                style: TextStyle(
                                  fontSize: textScaleFactor * 16,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(height: srcheight * 0.05),
                              Form(
                                key: _formKey,
                                  child:Column(
                                    children: [
                                      TextFormField(
                                        validator: (value){
                                          if(value!.isEmpty){
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
                                            borderRadius:
                                            BorderRadius.circular(srcwidth * 0.04),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(srcwidth * 0.04),
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
                                        validator: (value){
                                          if(value!.isEmpty){
                                            return "Password is required";
                                          }
                                          return null;
                                        },
                                        controller: passwordController ,
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
                                            borderRadius:
                                            BorderRadius.circular(srcwidth * 0.04),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(srcwidth * 0.04),
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

                                    ],
                                  ) ),


                              SizedBox(height: srcheight * 0.01),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    // Handle forgot password
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: const Color(0xFF6A11CB),
                                      fontWeight: FontWeight.bold,
                                      fontSize: textScaleFactor * 14,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: srcheight * 0.03),
                              ElevatedButton(
                                onPressed: () {
                                  if(_formKey.currentState!.validate()) {
                                    validator:
                                        (value) {
                                      if (value!.isEmpty) {
                                        return "Don't leave the field empty";
                                      }
                                      return null;
                                    };

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
                                    borderRadius:
                                    BorderRadius.circular(srcwidth * 0.04),
                                  ),
                                  elevation: 5,
                                ),
                                child:loading? CircularProgressIndicator(strokeWidth: 3,color: Colors.white,):Text('Login')  ,
                              ),
                              SizedBox(height: srcheight * 0.03),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account? ",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: textScaleFactor * 14,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));

                                    },
                                    child: Text(
                                      'Sign Up',
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
      ),
    );
  }
}
