import 'package:flutter/material.dart';
import 'package:anglican_lagos/style/theme.dart' as Theme;
class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[400],
    );
  }
}