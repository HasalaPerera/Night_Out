import 'package:cloud_firestore/cloud_firestore.dart';

class user {
  final String username;
  final String uid;
  final String District;
  final String email;
  final String userimageurl;

  const user({
    required this.username,
    required this.uid,
    required this.District,
    required this.email,
    required this.userimageurl,
  });

  Map<String, dynamic> tojson() => {
        'user name': username,
        'uid': uid,
        'faculty': District,
        'email': email,
        'userimageurl': userimageurl,
      };

  static user fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return user(
      username: snapshot['user name'] ?? '',
      uid: snapshot['uid'] ?? '',
      District: snapshot['District'] ?? '',
      email: snapshot['email'] ?? '',
      userimageurl: snapshot['userimageurl'] ?? '',
    );
  }
}
