import 'package:deezer/Screens/Authenticate/login.dart';
import 'package:deezer/Screens/Authenticate/signup.dart';
import 'package:deezer/Services/auth.dart';
import 'package:deezer/Shared/loading.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LandingPage();
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Container(
              child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 70.0),
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "SmarTunes",
                          style:
                              TextStyle(fontSize: 40.0, color: Colors.pinkAccent),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              child: getAssetImage("lib/images/music4.png", 50.0),
                              margin: EdgeInsets.only(right: 120.0),
                            ),
                            Container(
                              child: getAssetImage("lib/images/music4.png", 25.0),
                              margin: EdgeInsets.only(right: 100.0, bottom: 80.0),
                            ),
                            Container(
                              child: getAssetImage("lib/images/music4.png", 150.0),
                              margin: EdgeInsets.only(right: 20.0),
                            ),
                            Container(
                              child: getAssetImage("lib/images/music4.png", 20.0),
                              margin: EdgeInsets.only(top: 5.0),
                            ),
                            Container(
                              child: getAssetImage("lib/images/music4.png", 50.0),
                              margin: EdgeInsets.only(left: 120.0),
                            ),
                            Container(
                              child: getAssetImage("lib/images/music4.png", 25.0),
                              margin: EdgeInsets.only(left: 100.0, bottom: 80.0),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80.0,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Stream any song, anywhere, anytime",
                            style: TextStyle(fontSize: 30.0), textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(
                          height: 80.0,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: OutlineButton(
                                  padding: EdgeInsets.only(
                                      top: 14.0,
                                      bottom: 14.0,
                                      left: 48.0,
                                      right: 48.0),
                                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                                  highlightedBorderColor: Colors.black54,
                                  highlightColor: Colors.black12,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0)),
                                  child: Text(
                                    "LOG IN",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Login()));
                                  }),
                            ),
                            SizedBox(
                              width: 13.0,
                            ),
                            Expanded(
                              child: FlatButton(
                                  color: Colors.pinkAccent,
                                  padding: EdgeInsets.only(
                                      top: 15.0,
                                      bottom: 15.0,
                                      left: 48.0,
                                      right: 48.0),
                                  highlightColor: Colors.pinkAccent.shade100,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0)),
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SignUp()));
                                  }),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ]),
            ),
          );
  }

  Widget getAssetImage(String path, double height) {
    AssetImage assetImage = AssetImage(path);
    Image image = Image(
      image: assetImage,
      height: height,
    );
    return image;
  }
}
