import 'dart:convert';

import 'package:deezer/Screens/http_service.dart';
import 'package:deezer/Screens/music_data.dart';
import 'package:deezer/Screens/music_player.dart';
import 'package:deezer/Screens/music_player2.dart';
import 'package:deezer/Screens/recommended_playlists.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
  Map allData;
  static List musicData;

  final HttpService httpService = HttpService();
  Future passMusic;
  Future passPlaylists;

  @override
  void initState() {
    super.initState();
    passMusic = _getMusic();
    passPlaylists = _getPlaylists();
  }

  _getMusic() async {
    return await httpService.getMusic();
  }

  _getPlaylists() async {
    return await httpService.getPlaylists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            // padding: EdgeInsets.fromLTRB(20.0, 50, 20, 20),
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 50, bottom: 20.0),
              child: Text(
                "Music",
                style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Made for you",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 230.0,
              child: FutureBuilder(
                future: passMusic,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<MusicData> music = snapshot.data;
                    return ListView(
                      padding: EdgeInsets.only(left: 15.0),
                      scrollDirection: Axis.horizontal,
                      children: music
                          .map(
                            (MusicData musicData) => Container(
                              child: GestureDetector(
                                child: Slide(musicData.cover, musicData.title),
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MusicPlayer(musicData))),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Recommended playlists",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 230.0,
              child: FutureBuilder(
                future: passPlaylists,
                builder: (context2, snapshot2) {
                  if (snapshot2.hasData) {
                    List<RecommendedPlaylists> music = snapshot2.data;
                    return ListView(
                      padding: EdgeInsets.only(left: 15.0),
                      scrollDirection: Axis.horizontal,
                      children: music
                          .map(
                            (RecommendedPlaylists playlists) => Container(
                              child: GestureDetector(
                                child: Slide(playlists.cover, playlists.title),
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MusicPlayer2(playlists))),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
          ],
        )),
      ),
    );
  }

  Container Slide(String image, String title) {
    return Container(
      width: 160.0,
      child: Card(
        elevation: 0.0,
        child: Wrap(
          children: <Widget>[
            Image(
              image: NetworkImage(image),
            ),
            ListTile(
              title: Text(title,
                  style: TextStyle(fontSize: 15.0, color: Colors.grey)),
            )
          ],
        ),
      ),
    );
  }
}
