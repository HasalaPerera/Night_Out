import 'package:final_ui/methods/authentication.dart';
import 'package:final_ui/models/user.dart' as models;
import 'package:flutter/material.dart';

class userprovider with ChangeNotifier {
  models.user? _user;
  final authmethods _authmetods = authmethods();

  models.user? get getUser => _user;

  Future<void> refreshUser() async {
    models.user? user = await _authmetods.getuserdetails();
    _user = user;

    notifyListeners();
  }
}
