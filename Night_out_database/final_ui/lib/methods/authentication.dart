import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_ui/methods/storage.dart';
import 'package:final_ui/models/user.dart' as models;
import 'package:firebase_auth/firebase_auth.dart';

class authmethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<models.user> getuserdetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return models.user.fromsnap(snap);
  }

  //signup user
  Future<String> signupuser({
    required String username,
    required String district,
    required String email,
    required String password,
    required Uint8List file,
  }) async {
    String res = 'Some error occurred';
    try {
      if (username.isNotEmpty ||
          district.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty ||
          file != null) {
        //register the user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);
        String userimageurl = await storagemethods()
            .uploadimagetostorage('profile pics', file, false);
        //add user to the data base

        models.user user = models.user(
            username: username,
            uid: cred.user!.uid,
            District: district,
            userimageurl: userimageurl,
            email: email);
        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.tojson(),
            );

        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
  //login the user

  Future<String> loginuser({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = 'success';
      } else {
        res = 'please enter the email and password';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
