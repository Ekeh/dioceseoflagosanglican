import 'package:flutter/material.dart';
class SeparatorShort extends StatelessWidget {
  final Color color;
  const SeparatorShort({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return new Container(
                margin: new EdgeInsets.symmetric(vertical: 10.0),
            height: 2.0,
            width: 20.0,
            color: color == null ?  new Color(0xFFC0C0C0) : color
       );
  }
}