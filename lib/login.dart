// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/home.dart';
import 'package:flutter_auth/main.dart';
import 'package:flutter_auth/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controllers

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pswdController = TextEditingController();

  bool isLoading = false;

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _pswdController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded),
          iconSize: 30,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Login to your account",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    inputFile(
                      controller: _emailController,
                      label: "Email",
                      obsecureText: false,
                      iconEnt: const Icon(Icons.mail),
                    ),
                    const SizedBox(
                      height: 10,
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
                                minWidth: double.infinity,
                                height: 60,
                                onPressed: () async {
                                  if (_emailController.text.isEmpty &&
                                      _pswdController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "Please enter email and password !"),
                                      ),
                                    );
                                  } else if (_emailController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Please enter a email !"),
                                      ),
                                    );
                                  } else if (_pswdController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Please enter a password !"),
                                      ),
                                    );
                                  } else if (!_emailController.text
                                          .contains('@') &&
                                      !_emailController.text.contains('.')) {
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
                                    user = await login(
                                        email: _emailController.text,
                                        password: _pswdController.text,
                                        context: context);

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
                                              "Error occured while logging in !"),
                                        ),
                                      );
                                    }
                                  }
                                },
                                color: Colors.blue,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return const SignupPage();
                                  }),
                                );
                              },
                              child: const Text(
                                "Don't have an account ? Sign up",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            // CircularProgressIndicator(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Text(
              //       "Don't have an account ? Sign up",
              //       style: TextStyle(
              //         fontWeight: FontWeight.w600,
              //         fontSize: 16,
              //       ),
              //     ),
              //   ],
              // ),
              // Container(
              //   padding: EdgeInsets.only(top: 100),
              //   height: 200,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage("images/welcome.png"),
              //       fit: BoxFit.fitHeight,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

//login function
User? user;
Future<User?> login(
    {required String email,
    required String password,
    required BuildContext context}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    user = userCredential.user;
  } on FirebaseAuthException catch (e) {
    if (e.code == "user-not-found") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("User not found!"),
        ),
      );
    }
    if (e.code == "invalid-email") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid email address!"),
        ),
      );
    }
    if (e.code == "wrong-password") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Wrong password!"),
        ),
      );
    }
    if (e.code == "user-disabled") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("User disabled!"),
        ),
      );
    }
    print(e.code);
  }
  return user;
}
