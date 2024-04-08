import 'dart:typed_data';

import 'package:final_ui/methods/authentication.dart';
import 'package:final_ui/pages/home.dart';
import 'package:final_ui/pages/sign%20in.dart';
import 'package:final_ui/utilities/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String email = "", password = "", name = "", district = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Uint8List? _image;
  bool _isloading = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    districtController.dispose();
    passwordController.dispose();
  }

  void signupuser() async {
    String res = await authmethods().signupuser(
      email: emailController.text,
      password: passwordController.text,
      username: nameController.text,
      district: districtController.text,
      file: _image!,
    );
    setState(() {
      _isloading = false;
    });
    if (res != "success") {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => const Home())),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // If user registration is successful, you can save additional data to Firestore here
        // For simplicity, I'm not adding Firestore data saving in this example

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color.fromARGB(255, 49, 145, 52),
          content: Text(
            "Registered Successfully",
            style: TextStyle(fontSize: 20.0),
          ),
        ));

        // Clear all text field controllers after successful registration
        nameController.clear();
        emailController.clear();
        districtController.clear();
        passwordController.clear();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color.fromARGB(255, 79, 78, 4),
            content: Text(
              "Password provided is too weak",
              style: TextStyle(fontSize: 18.0),
            ),
          ));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color.fromARGB(255, 160, 46, 46),
            content: Text(
              "Account already exists",
              style: TextStyle(fontSize: 18.0),
            ),
          ));
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Full Name"),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Email"),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    TextFormField(
                      controller: districtController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your district';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "District"),
                      onChanged: (value) {
                        setState(() {
                          district = value;
                        });
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: "Password"),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: true,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 0, left: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    color: Color.fromRGBO(192, 118, 230, 1),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    onPressed: register,
                    child: _isloading
                        ? const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Color.fromRGBO(192, 118, 230, 1),
                            ),
                          )
                        : const Text(
                            "Register",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                        // Add your sign-in functionality here
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
