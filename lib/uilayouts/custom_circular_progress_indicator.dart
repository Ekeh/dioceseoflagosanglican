import 'package:flutter/material.dart';
class CustomCircularProgressIndicator extends StatelessWidget {
  final Color color;

  const CustomCircularProgressIndicator({this.color = Colors.white,});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(color),
    ),);
  }
}