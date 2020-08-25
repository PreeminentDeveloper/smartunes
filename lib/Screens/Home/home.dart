import 'package:deezer/Screens/Models/user.dart';
import 'package:deezer/Screens/Tabs/favorites.dart';
import 'package:deezer/Screens/Tabs/music.dart';
import 'package:deezer/Screens/Tabs/profile.dart';
import 'package:deezer/Screens/Tabs/search.dart';
import 'package:deezer/Services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  final String email, username;
  Home({this.email, this.username});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static String email3, username2;

  var _currentIndex = 0;

  var tabs = [
    Music(),
    Favorites(),
    Search(),
    Profile(email: email3, username: username2),
  ];

  

  @override
  Widget build(BuildContext context) {
    print("Direct email : ${widget.email}");
    print("Yewah yewh $email3");
    return Scaffold(
      
      body: Container(
        child: tabs[_currentIndex],
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            title: Text("Music"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Favorites"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          )
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
            email3 = widget.email;
            username2 = widget.username;
            print("The username of this user is actually $email3 and $username2");
          });
        },
      ),
    );
  }
}
