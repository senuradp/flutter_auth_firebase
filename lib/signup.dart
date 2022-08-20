// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/home.dart';
import 'package:flutter_auth/login.dart';
import 'package:flutter_auth/main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //controllers

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pswdController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        // toolbarHeight: 30,
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
            // Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const MainPage();
                },
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_rounded),
          iconSize: 30,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          // height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Sign up here to create a new account !",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    inputFile(
                      controller: _firstNameController,
                      label: "First Name",
                      obsecureText: false,
                      iconEnt: const Icon(Icons.person),
                    ),
                    inputFile(
                      controller: _lastNameController,
                      label: "Last Name",
                      obsecureText: false,
                      iconEnt: const Icon(Icons.person),
                    ),
                    inputFile(
                      controller: _emailController,
                      label: "Email",
                      obsecureText: false,
                      iconEnt: const Icon(Icons.mail),
                    ),
                    inputFile(
                      controller: _pswdController,
                      label: "Password",
                      obsecureText: true,
                      iconEnt: const Icon(Icons.key),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: [
                        isLoading
                            ? const CircularProgressIndicator()
                            : MaterialButton(
                                onPressed: () async {
                                  if (_firstNameController.text.isEmpty &&
                                      _lastNameController.text.isEmpty &&
                                      _emailController.text.isEmpty &&
                                      _pswdController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Please enter all fields !"),
                                      ),
                                    );
                                  } else if (_firstNameController
                                      .text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "Please enter the first name !"),
                                      ),
                                    );
                                  } else if (_lastNameController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "Please enter the last name !"),
                                      ),
                                    );
                                  } else if (_emailController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Please enter the email !"),
                                      ),
                                    );
                                  } else if (_pswdController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Please enter the password !"),
                                      ),
                                    );
                                  } else if (!_emailController.text
                                      .contains('@')) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "Please enter a valid email !"),
                                      ),
                                    );
                                  } else if (!_emailController.text
                                      .contains('.')) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "Please enter a valid email !"),
                                      ),
                                    );
                                  } else if (_pswdController.text.length < 6) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "Please enter a password with more than 6 characters!"),
                                      ),
                                    );
                                  } else {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    //await -> wait till signup then moves onto the others
                                    user = await signup(
                                      _firstNameController.text,
                                      _lastNameController.text,
                                      _emailController.text,
                                      _pswdController.text,
                                    );
                                    if (user != null) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      // CircularProgressIndicator();
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) => const Home(),
                                        ),
                                      );
                                    } else {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "Error occured during signup !"),
                                        ),
                                      );
                                    }
                                  }
                                },
                                color: Colors.blue,
                                minWidth: double.infinity,
                                height: 60,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return const LoginPage();
                              }),
                            );
                          },
                          child: const Text(
                            "Already have an account ? Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//signup function
User? user;
Future<User?> signup(
    String fName, String lName, String email, String password) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    user = userCredential.user;
    Map<String, dynamic> userInfoMap = {
      "FirstName": fName,
      "LastName": lName,
      "Email": email
    };

    if (userCredential != null) {
      FirebaseFirestore.instance
          .collection("Users")
          .doc(auth.currentUser?.uid)
          .set(userInfoMap);
    }
  } catch (e) {
    print("error occured");
  }
  return user;
}
