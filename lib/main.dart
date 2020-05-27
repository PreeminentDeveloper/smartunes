import 'package:deezer/Screens/Models/user.dart';
import 'package:deezer/Screens/wrapper.dart';
import 'package:deezer/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.pinkAccent,
        title: "Deezer",
        home: Wrapper(),
        theme: ThemeData(
          fontFamily: 'Abel',
        ),
      ),
    );
  }
}


