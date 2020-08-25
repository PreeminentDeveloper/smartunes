import 'dart:io';
import 'package:deezer/Services/auth.dart';
import 'package:deezer/Shared/loading.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ManageAccount extends StatefulWidget {

  final String email, username;
  ManageAccount({this.email, this.username});
  @override
  _ManageAccountState createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
  
  AuthService _auth = AuthService();

  File _image;
  File _uploadedImage;

  bool loading = false;

  @override
  Widget build(BuildContext context) {

    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image; 
        print("Image p,ath: $_image");
      });
    }

    Future uploadImage(BuildContext context) async {
    String fileName = basename(_image.path);
    StorageReference firebaseStorageReference =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageReference.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    var uploadedImage = await firebaseStorageReference.getDownloadURL();

      // _uploadedImage = uploadedImage;

    setState(() {
      loading = false;
      print("Profile picture uploaded!");
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text("Profile image uploaded"),
      // ));
    });
  }

    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.pinkAccent),
        title: Text(
          "My Account",
          style:
              TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 20.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: _image == null
                          ? AssetImage("lib/images/avatar.jpg")
                          : FileImage(_image, scale: 1.0),
                      maxRadius: 60.0,
                    ),
                    IconButton(
                        icon: Icon(FontAwesomeIcons.camera),
                        onPressed: () {
                          getImage();
                        }),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Oluwasegun Badaru",
                            // "${widget.username}",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "${widget.email}",
                            style: TextStyle(fontSize: 14.0) , textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5.0),
                          FlatButton(
                            child: Text(
                              "upload",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: Colors.pinkAccent,
                            textColor: Colors.white,
                            onPressed: () {
                              setState(() => loading = true);
                              uploadImage(context);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  _changeDialog(context, "Change Email", "Password", true, "New Email",
                      false, "Confirm Email", false);
                },
                title: Text("Change email", style: TextStyle(fontSize: 20.0)),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                onTap: () {
                  _changeDialog(context, "Change Password", "Old Password", true,
                      "New Password", true, "Confirm Password", true);
                },
                title:
                    Text("Change password", style: TextStyle(fontSize: 20.0)),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                onTap: () async {
                  await _auth.signOut();
                  Navigator.of(context).pop();
                },
                title: Text("Log out", style: TextStyle(fontSize: 20.0)),
              ),
              Divider(
                height: 0.0,
              ),
              ListTile(
                onTap: () {},
                title: Text("Communication preferences",
                    style: TextStyle(fontSize: 20.0)),
              ),
              Divider(
                height: 0.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeDialog(BuildContext context, String title, String hint1, bool show1, String hint2,
      bool show2, String hint3, bool show3) {
    showDialog(
        context: (context),
        builder: (BuildContext context) {
      return SingleChildScrollView(
        child: AlertDialog(
          title: Text(
            title,
            style: TextStyle(
                color: Colors.pinkAccent, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: 170.0,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: Column(
              children: <Widget>[
                TextField(
                  obscureText: show1,
                  decoration: InputDecoration(
                    hintText: hint1,
                    // border: UnderlineInputBorder(borderSide: BorderSide.none)
                  ),
                ),
                TextField(
                  obscureText: show2,
                  decoration: InputDecoration(
                    hintText: hint2,
                  ),
                ),
                TextField(
                  obscureText: show3,
                  decoration: InputDecoration(
                    hintText: hint3,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.pinkAccent, fontSize: 17.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: 5.0),
                FlatButton(
                  child: Text("Done",
                      style:
                          TextStyle(color: Colors.pinkAccent, fontSize: 17.0)),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
