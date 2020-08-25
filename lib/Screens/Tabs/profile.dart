import 'package:deezer/Screens/Models/user.dart';
import 'package:deezer/Screens/Settings/manage_account.dart';
import 'package:deezer/Screens/about.dart';
import 'package:deezer/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  final String email, username;
  Profile({this.email, this.username});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  AuthService _auth = AuthService();
  ManageAccount manageAccount = ManageAccount();

  @override
  Widget build(BuildContext context) {
    print("Hello ${widget.email}");

    return SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 50, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage("lib/images/avatar.jpg"),
                      maxRadius: 60.0,
                      backgroundColor: Colors.pinkAccent,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.username != null
                                ? "Welcome ${widget.username}"
                                : "Welcome!",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.username != null
                                ? "${widget.email}"
                                : "Start streaming songs.",
                            // "${widget.email}",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 20.0),
                          // FlatButton(
                          //   child: Text(
                          //     "Edit Profile",
                          //     style: TextStyle(fontWeight: FontWeight.bold),
                          //   ),
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(20.0),
                          //   ),
                          //   color: Colors.pinkAccent,
                          //   textColor: Colors.white,
                          //   onPressed: () {
                          //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ManageAccount(email: widget.email)));
                          //   },
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Divider(
            height: 0.0,
          ),
          ListTile(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => ManageAccount()));
            },
            leading: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 20.0,
                color: Colors.white,
              ),
              backgroundColor: Colors.grey,
            ),
            title: Text("Manage my account", style: TextStyle(fontSize: 20.0)),
          ),
          Divider(
            height: 0.0,
          ),
          ListTile(
            onTap: () {},
            leading: CircleAvatar(
              child: Icon(
                Icons.visibility,
                size: 20.0,
                color: Colors.white,
              ),
              backgroundColor: Colors.grey,
            ),
            title: Text("Display settings", style: TextStyle(fontSize: 20.0)),
          ),
          Divider(
            height: 0.0,
          ),
          ListTile(
            onTap: () {},
            leading: CircleAvatar(
              child: Icon(
                Icons.equalizer,
                size: 20.0,
                color: Colors.white,
              ),
              backgroundColor: Colors.grey,
            ),
            title: Text("Audio settings", style: TextStyle(fontSize: 20.0)),
          ),
          Divider(
            height: 0.0,
          ),
          ListTile(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => About())),
            leading: CircleAvatar(
              child: Icon(
                Icons.info_outline,
                size: 20.0,
                color: Colors.white,
              ),
              backgroundColor: Colors.pinkAccent,
            ),
            title: Text("About", style: TextStyle(fontSize: 20.0)),
          ),
          Divider(
            height: 0.0,
          ),
          ListTile(
            onTap: () async {
              await _auth.signOut();
              Navigator.of(context).pop();
            },
            leading: CircleAvatar(
              child: Icon(
                Icons.power_settings_new,
                size: 20.0,
                color: Colors.white,
              ),
              backgroundColor: Colors.grey,
            ),
            title: Text("Log Out", style: TextStyle(fontSize: 20.0)),
          ),
          Divider(
            height: 0.0,
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
