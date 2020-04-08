import 'package:flutter/material.dart';
import 'package:anglican_lagos/common/app_consts.dart';
import 'package:anglican_lagos/common/color_utility.dart';
import 'dart:io';
class LinearGradientBackground extends StatelessWidget {
  final String bottomTitle;
  final Color startColour;
  final Color endColour;
  LinearGradientBackground({this.startColour : const Color(0xFF575b5e),
                          this.endColour :  ColorUtility.COLOR_PRIMARY_DARK,
                           this.bottomTitle : 'S H U F F L E S    T V'});
  @override
  Widget build(BuildContext context){
    return new Container(
        //color: ColorUtility.COLOR_PRIMARY,
        /*decoration: new BoxDecoration(
          color: ColorUtility.COLOR_PRIMARY,
          image: new DecorationImage(
            image: new AssetImage(AppConsts.Bg),
            fit: BoxFit.cover,
          ),
        ),*/
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    startColour,
                    endColour
                   // const Color(0xFF000000)

                  ],
                  stops: [0.0, 1.0],
                )
            ),
            child: new Align(
                alignment: FractionalOffset.bottomCenter,
                child: new Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(top: 30.0),
                  child: new Text(
                    bottomTitle,
                    style: Theme.of(context).textTheme.headline.copyWith(
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    )
                  )

                )
            )
        );
  }
}