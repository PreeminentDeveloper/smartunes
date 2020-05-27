import 'package:deezer/Screens/Tabs/favorites.dart';
import 'package:deezer/Screens/Tabs/music.dart';
import 'package:deezer/Screens/Tabs/profile.dart';
import 'package:deezer/Screens/Tabs/search.dart';
import 'package:deezer/Services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AuthService _auth = AuthService();
  var _currentIndex = 0;

  final tabs = [
    Music(),
    Favorites(),
    Search(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
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
          });
        },
      ),
    );
  }
}
