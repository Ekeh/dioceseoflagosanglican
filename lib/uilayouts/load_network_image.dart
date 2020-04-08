import 'package:flutter/material.dart';

class LoadNetworkImage{
  static ImageProvider load(String url, {double scale: 1.0, Map<String, String> headers}){
    try {
      return new NetworkImage(url, scale: scale, headers: headers);
    }catch(e){
      print(e);
    }
    return new AssetImage('assets/img/member2.png');
  }


}