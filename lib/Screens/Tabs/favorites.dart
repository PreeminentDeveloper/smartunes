import "package:flutter/material.dart";

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  int incrFav = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 50, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Recently Played",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 150.0,
                width: 150.0,
                child: Image(
                  image: AssetImage("lib/images/track1.jpg"),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Downloaded",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Icon(Icons.file_download, color: Colors.grey),
                ],
              ),
              SizedBox(
              height: 10.0,
            ),
            Divider(height: 15.0, color: Colors.grey),
            SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Favorite Tracks",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text("$incrFav", style: TextStyle(color: Colors.grey))
                ],
              ),
              SizedBox(
              height: 10.0,
            ),
            Divider(height: 15.0, color: Colors.grey),
            SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Playlists",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text("1", style: TextStyle(color: Colors.grey))
                ],
              ),
              SizedBox(
              height: 10.0,
            ),
            Divider(height: 15.0, color: Colors.grey),
            SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Albums",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text("0", style: TextStyle(color: Colors.grey))
                ],
              ),
              SizedBox(
              height: 10.0,
            ),
            Divider(height: 15.0, color: Colors.grey),
            SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Artists",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text("2", style: TextStyle(color: Colors.grey))
                ],
              ),
              SizedBox(
              height: 10.0,
            ),
            Divider(height: 15.0, color: Colors.grey),
            SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Mixes",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text("0", style: TextStyle(color: Colors.grey))
                ],
              ),
            ],
          )),
    );
  }
}
