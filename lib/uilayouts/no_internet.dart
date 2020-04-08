import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:anglican_lagos/style/styles.dart';
import 'package:anglican_lagos/uilayouts/custom_button.dart';
class NoInternet extends StatelessWidget {
 final VoidCallback onPressed;
 final double height;
 final String title;

  const NoInternet({Key key,this.title, this.onPressed, this.height = 0.0}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Center(
      child: Card(
        margin: EdgeInsets.all(0),
        elevation: 0.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: this.height > 0 ?
        Container(
          width: double.infinity,
          height: this.height,
          padding: EdgeInsets.all(20.0),
          child: _NoInternetMessage(onPressed: onPressed,),
        ) :
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          child: _NoInternetMessage(onPressed: onPressed,),
        ),
      ),
    );
  }
}
class _NoInternetMessage extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const _NoInternetMessage({Key key,this.title, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children:<Widget>[
          Icon(Icons.signal_wifi_off, size: 200.0, color: Colors.grey[400],),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, top: 30.0),
            child: title != null ? Text(title, style: TextStyle(color: Colors.black),) : Text('No internet connection. Please connect to the internet and try again.', style: TextStyle(color: Colors.black)),
          ),
          onPressed != null ? CustomButton(text: 'Retry', icon: Icons.refresh, onPressed: onPressed) : Container(),
        ] );
  }
}
