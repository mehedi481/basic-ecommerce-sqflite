import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;

  void auth(String email, String pass) {
    if (email == 'admin@gmail.com' && pass == 'admin') {
      _isAdmin = true;
      notifyListeners();
    } else {
      _isAdmin = false;
      notifyListeners();
    }
  }
}
