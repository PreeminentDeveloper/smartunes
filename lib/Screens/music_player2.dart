import 'package:audioplayers/audioplayers.dart';
import 'package:deezer/Screens/recommended_playlists.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MusicPlayer2 extends StatefulWidget {

  final RecommendedPlaylists music;

  MusicPlayer2(this.music);

  @override
  _MusicPlayer2State createState() => _MusicPlayer2State();
}

class _MusicPlayer2State extends State<MusicPlayer2> {

  AudioPlayer audioPlayer = AudioPlayer();

  Duration _duration = new Duration();
  Duration _position = new Duration();

  String currentTime = "00:00";
  String completeTime = "00:00";

  bool isPlaying = false;
  
  double minimum = 0.0;
  int toggleSpeaker = 0;
  int addToFav = 0;
  
  Widget slider(){
    return Slider(
      activeColor: Colors.pinkAccent,
      inactiveColor: Colors.grey,
      value: _position.inSeconds.toDouble(),
      min: minimum,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value){
        setState(() {
          seekToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

  void seekToSecond(int second){
    Duration newDuration = Duration(seconds: second);
    audioPlayer.seek(newDuration);
  }

  void initPlayer(){
    audioPlayer.onDurationChanged.listen((Duration d){
      setState(() {
        print("Max duration: $d");
        _duration = d;
        completeTime = d.toString().split(".")[0];
      });
    });

    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      print("Current position: $p");
      setState(() {
        _position = p;
        currentTime = p.toString().split(".")[0];
      });
    });

  }

  play() async {
    int result = await audioPlayer.play(widget.music.preview);
    if (result == 1) {
     setState(() {
       isPlaying = true;
     });
    }

  }
  
  pause() async{
    int result = await audioPlayer.pause();
    if (result == 1){
      setState(() {
        isPlaying = false;
      });
    }
  }

  toggleToEarpieceOrSpeaker() async{
    int result = await audioPlayer.earpieceOrSpeakersToggle();
    if (result == 1){
      setState(() {
        if(toggleSpeaker == 0){
          toggleSpeaker = 1;
        }else{
          toggleSpeaker = 0;
        }
      });
    }
  }

  stop() async{
    int result = await audioPlayer.stop();
    if(result == 1){
      setState(() {
        isPlaying = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context);
        return stop();
      },
          child: Scaffold(
        body: Container(
          color: Colors.black87,
          padding: EdgeInsets.symmetric(vertical: 30.0, ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10.0),
                alignment: Alignment.topLeft,
                child: GestureDetector(
                    onTap: (){
                      stop();
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Colors.pinkAccent, size: 30.0,
                    )
                  )
              ),
              Container(
                padding: EdgeInsets.only(top: 30.0, left: 50.0, right: 50.0, bottom: 15.0),
                child: Image(image: NetworkImage(widget.music.cover))
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FaIcon(FontAwesomeIcons.share, color: Colors.white),
                    Icon(Icons.more_vert, color: Colors.white, size: 30.0),
                    GestureDetector(
                      child: Icon(
                        addToFav == 0 ? Icons.favorite_border : Icons.favorite, color: Colors.white,
                      ),
                      onTap: (){
                        setState(() {
                          if(addToFav == 0){
                            addToFav = 1;
                          }else{
                            addToFav = 0;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(currentTime, style: TextStyle(color: Colors.white),),
                    Text(completeTime, style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
              slider(),
              Expanded(child: Text(widget.music.title, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),)),
              Expanded(child: Text(widget.music.albumTitle, style: TextStyle(color: Colors.white, fontSize: 15.0),)),
              Padding(
                padding: const EdgeInsets.only(left: 60.0, right: 60.0, top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(child: GestureDetector(
                      child: Icon(
                        toggleSpeaker == 0 ? Icons.volume_down : Icons.volume_up, color: Colors.white, size: 26.0,),
                        onTap: (){
                          toggleToEarpieceOrSpeaker();
                        },
                      )
                    ),
                    Expanded(child: GestureDetector(
                        child: Icon(isPlaying == false ? Icons.play_arrow : Icons.pause, color: Colors.white, size: 60.0),
                          onTap: (){
                            if(isPlaying == false){
                              play();
                              
                              setState(() {
                                isPlaying = true;
                              });
                            }else{
                              pause();

                              setState(() {
                                isPlaying = false;
                              });
                            }
                            
                          },
                        )
                      ),
                    Expanded(child: GestureDetector(
                      child: Icon(
                        Icons.stop, color: Colors.white, size: 26.0),
                        onTap: (){
                          stop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))
      ),
    );
  }
}