import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Function to update user data in Firebase
  void _updateUserData() {
    // Get current user ID (assuming you have a method to retrieve it)
    String userId = getCurrentUserId();

    // Update user data in Firestore
    FirebaseFirestore.instance.collection('users').doc(userId).update({
      'fullName': _fullNameController.text,
      'email': _emailController.text,
      'district': _districtController.text,
    }).then((value) {
      // Data updated successfully
      // You can show a message or perform other actions
      print('User data updated successfully');
    }).catchError((error) {
      // Handle errors if any
      print('Failed to update user data: $error');
    });

    // Optionally, update profile picture in Firebase Storage
  }

  // Dummy method to get current user ID
  String getCurrentUserId() {
    // Implement your logic to retrieve current user ID
    return 'user123'; // For example
  }

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
            TextField(
              controller: _fullNameController,
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
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                (
                  onPressed: _updateUserData,
                  child: Text('Update Profile'),
                );
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
