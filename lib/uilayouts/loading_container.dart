import 'package:flutter/material.dart';
import 'package:anglican_lagos/style/styles.dart';
class LoadingContainer extends StatelessWidget {
  final String title;
  LoadingContainer({this.title});
  @override
  Widget build(BuildContext context){
    return Center(
      child: Card(
        elevation: 0.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 120,
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children:<Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(title != null ? title : 'Loading...', style: Styles.italic.copyWith(fontSize: 18.0, color: Colors.black),),
                  ),
                  CircularProgressIndicator()
                ] ),),
        ),
      ),
    );
  }
}