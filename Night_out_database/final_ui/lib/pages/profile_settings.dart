import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  late String _userId;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  // Function to retrieve user data from Firestore
  void _getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _userId = user.uid;
        _usernameController.text = user.displayName ?? '';
        _emailController.text = user.email ?? '';
      });

      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(_userId)
          .get();

      setState(() {
        _districtController.text = userData['district'];
      });
    }
  }

  // Function to update user data in Firestore
  void _updateUserData() async {
    // Update user data in Firestore
    await FirebaseFirestore.instance.collection('users').doc(_userId).update({
      'username': _usernameController.text,
      'email': _emailController.text,
      'district': _districtController.text,
    });

    // Update password if not empty
    String password = _passwordController.text.trim();
    if (password.isNotEmpty) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updatePassword(password);
      }
    }

    print('User data updated successfully');
  }

  // Function to handle image selection and upload

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
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
    );
  }
}
