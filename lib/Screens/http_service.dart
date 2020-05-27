import 'dart:convert';
import 'package:deezer/Screens/music_data.dart';
import 'package:deezer/Screens/recommended_playlists.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class HttpService{

  final String musicUrl = "https://api.deezer.com/artist/1450/top?limit=50";
  final String musicUrl2 = "https://api.deezer.com/artist/27/top?limit=50";
  Map body;
  Map body2;

  Future<List<MusicData>>getMusic() async{

    Response response = await get(musicUrl);
    if(response.statusCode == 200){
      body = jsonDecode(response.body);
      List music = body['data'];
      List<MusicData>musicData = []; 

      for(var m in music){
        MusicData data = MusicData(m["id"], m["title"], m["preview"], m['album']['cover_big'], m['album']['title']);
        musicData.add(data);
      }

      return musicData;
    }else{
      throw "Can't get music.";
    }

  }

  Future<List<RecommendedPlaylists>> getPlaylists() async{

    Response response2 = await get(musicUrl2);
    if(response2.statusCode == 200){
      body2 = jsonDecode(response2.body);
      List music2 = body2['data'];
      List<RecommendedPlaylists>musicData2 = []; 

      for(var m in music2){
        RecommendedPlaylists data2 = RecommendedPlaylists(m["id"], m["title"], m["preview"], m['album']['cover_big'], m['album']['title']);
        musicData2.add(data2);
      }

      return musicData2;
    }else{
      throw "Can't get music.";
    }

  }
}

