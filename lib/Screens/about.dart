import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text(
          "About",
          style: TextStyle(fontSize: 25.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("lib/images/pdev.jpg"),
                    )),
              ),
              SizedBox(height: 20.0),
              Text(
                "Preeminent Oluwasegun",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("Flutter Developer",
                  style: TextStyle(
                      color: Colors.white, letterSpacing: 4.0, fontSize: 20.0)),
                      SizedBox(height: 10.0,),
              InkWell(
                  child: Text(
                    "Hook me up on WhatsApp!",
                    style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                  ),
                  onTap: () async {
                    const url = 'https://wa.me/2348023816868';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  }),
              SizedBox(
                height: 30.0,
              ),
              Divider(color: Colors.white, height: 30.0,),
              Center(
                child: Text(
                  "This app basically focuses on streaming music from the internet.",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              Divider(color: Colors.white, height: 30.0,),
            ],
          ),
        ),
      ),
    );
  }
}
