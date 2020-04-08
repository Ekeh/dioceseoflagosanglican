import 'package:flutter/material.dart';
import 'package:anglican_lagos/common/app_consts.dart';
import 'package:anglican_lagos/uilayouts/offline_page.dart';

class FlatScreen extends StatefulWidget {
  @override
  _FlatScreenState createState() => _FlatScreenState();
}

class _FlatScreenState extends State<FlatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
      Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(AppConsts.Bg, fit: BoxFit.cover,),
      ),
      SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //Contents goes here
            Text('Welcome default')
          ],
        ),
      ),

      ///Must be last
      new OfflinePage(),
      ]
    )
    );
      ///Contest here down

  }
}
