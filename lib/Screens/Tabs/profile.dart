import 'package:deezer/Screens/Settings/manage_account.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  ManageAccount manageAccount = ManageAccount();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20.0, 50, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Profile",
                style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage("lib/images/seg2.jpg"),
                    maxRadius: 60.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Oluwasegun Badaru",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "Preeminent Developer",
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(height: 5.0),
                        FlatButton(
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Colors.pinkAccent,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ManageAccount()));
                          },
                        ),
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
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ManageAccount()));
          },
          leading: CircleAvatar(child: Icon(Icons.person, size: 20.0, color: Colors.white,), backgroundColor: Colors.pinkAccent,),
          title: Text("Manage my account", style: TextStyle(fontSize: 20.0)),
        ),
        Divider(
          height: 0.0,
        ),
        ListTile(
          onTap: () {},
          leading: CircleAvatar(child: Icon(Icons.visibility, size: 20.0, color: Colors.white,), backgroundColor: Colors.grey,),
          title: Text("Display settings", style: TextStyle(fontSize: 20.0)),
        ),
        Divider(
          height: 0.0,
        ),
        ListTile(
          onTap: () {},
          leading: CircleAvatar(child: Icon(Icons.equalizer, size: 20.0, color: Colors.white,), backgroundColor: Colors.grey,),
          title: Text("Audio settings", style: TextStyle(fontSize: 20.0)),
        ),
        Divider(
          height: 0.0,
        ),
        ListTile(
          onTap: () {},
          leading: CircleAvatar(child: Icon(Icons.settings_applications, size: 20.0, color: Colors.white,), backgroundColor: Colors.grey,),
          title: Text("App Settings", style: TextStyle(fontSize: 20.0)),
        ),
        Divider(
          height: 0.0,
        ),
        ListTile(
          onTap: () {},
          leading: CircleAvatar(child: Icon(Icons.info_outline, size: 20.0, color: Colors.white,), backgroundColor: Colors.grey,),
          title: Text("About", style: TextStyle(fontSize: 20.0)),
        ),
        Divider(
          height: 0.0,
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
