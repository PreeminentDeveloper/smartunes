import "package:flutter/material.dart";

class SearchBarPage extends StatefulWidget {
  @override
  _SearchBarPageState createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 110.0,
            padding: const EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(28.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    offset: Offset(0.0, 2.5),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      offset: Offset(1.0, -0.9),
                      blurRadius: 5.0,
                      spreadRadius: 1.0)
                ]),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Artists, tracks, playlists...",
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: Icon(
                  Icons.keyboard_voice,
                  color: Colors.grey,
                ),
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
