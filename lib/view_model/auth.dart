import 'package:basic_ecommerce_sqflite/utils/utils.dart';
import 'package:flutter/material.dart';

import '../utils/routes/route_name.dart';

class AuthProvider with ChangeNotifier {
  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;

  void admin(bool admin) {
    _isAdmin = admin;
    notifyListeners();
  }

  void auth(BuildContext context, String email, String pass) {
    if (email == 'admin@gmail.com' && pass == 'admin') {
      admin(true);
      Navigator.pushReplacementNamed(context, Routes.homePage);
    } else if (email == 'user@gmail.com' && pass == 'user') {
      admin(false);
      Navigator.pushReplacementNamed(context, Routes.homePage);
    } else {
      Utils.showMessage(
        message: "Authentication Faield !",
        bgColor: Colors.red,
      );
    }
  }
}
