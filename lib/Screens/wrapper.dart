import 'package:deezer/Screens/Authenticate/authentication.dart';
import 'package:deezer/Screens/Authenticate/signup.dart';
import 'package:deezer/Screens/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      final user = Provider.of<User>(context);

      // return either Home or Authenticate widget
      if (user == null) {
        return Authenticate();
      } else {
        return Home();
      }
  }
}