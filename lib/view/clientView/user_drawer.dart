import 'package:flutter/material.dart';

import '../../resource/colorManager.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          color: ColorManager.primaryColor,
          height: 200,
          child: const Center(
              child: Text(
            "Welcome to User View",
            style: TextStyle(fontSize: 20),
          )),
        ),
      ],
    ));
  }
}
