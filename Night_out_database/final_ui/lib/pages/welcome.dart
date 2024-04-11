import 'package:final_ui/pages/sign%20in.dart';
import 'package:final_ui/pages/signup.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4E2464),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/sidebar.jpg"))),
                ),
                Column(
                  children: <Widget>[
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      color: Color.fromRGBO(192, 118, 230, 10),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 23,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      color: Color.fromRGBO(192, 118, 230, 10),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "REGISTER",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 23,
                          color: Colors.white,
                        ),
                      ),
                    )
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
