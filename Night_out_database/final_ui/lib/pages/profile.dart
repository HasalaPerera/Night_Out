import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_ui/pages/add_event.dart';
import 'package:final_ui/pages/add_offers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _districtController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<String?> _fetchUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return userData['username'];
  }

  void _updateUserData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/profile.png"),
                        radius: 60.0,
                      ),
                      SizedBox(height: 10),
                      FutureBuilder<String?>(
                        future: _fetchUserName(),
                        builder: (BuildContext context,
                            AsyncSnapshot<String?> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else {
                            if (snapshot.hasData) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  " ${snapshot.data} ",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                  ),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return const Text("Error");
                            } else {
                              return const Text("Loading...");
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddEvent()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 203, 207, 210)),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 5.0),
                              ),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                const TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            child: const Text('Become an Event Planner'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddOffer()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 203, 207, 210)),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 5.0),
                              ),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                const TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            child: const Text('Add Offer'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 2,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 244, 74, 247),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Full Name'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _districtController,
                  decoration: InputDecoration(labelText: 'District'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'New Password'),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _updateUserData,
                  child: Text('Update Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
