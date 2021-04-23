import 'package:flutter/material.dart';
import 'package:anglican_lagos/common/color_utility.dart';

import 'modules/splash_screen.dart';
//List<CameraDescription> cameras;

void main(){
  // _initializeCameras();
  runApp(new MyApp());
}
/*_initializeCameras() async {
  cameras = await availableCameras();
}*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Diocese Of Lagos',
      theme: ThemeData(
        primaryColor: ColorUtility.COLOR_PRIMARY,
        scaffoldBackgroundColor: ColorUtility.COLOR_PRIMARY,
        accentColor: ColorUtility.COLOR_PRIMARY,
        textTheme: Theme.of(context).textTheme.copyWith(
          display1: Theme.of(context).textTheme.display1.copyWith(color: Colors.white),
          display2: Theme.of(context).textTheme.display2.copyWith(color: Colors.white),
          display3: Theme.of(context).textTheme.display3.copyWith(color: Colors.white),
          display4: Theme.of(context).textTheme.display4.copyWith(color: Colors.white),
          headline: Theme.of(context).textTheme.headline.copyWith(color: Colors.white),
          title: Theme.of(context).textTheme.title.copyWith(color: Colors.white),
          subhead: Theme.of(context).textTheme.subhead.copyWith(color: Colors.white),
          body1: Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
          body2: Theme.of(context).textTheme.body2.copyWith(color: Colors.white),
          caption: Theme.of(context).textTheme.caption.copyWith(color: Colors.white),
          button: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
          subtitle: Theme.of(context).textTheme.subhead.copyWith(color: Colors.white),
          overline: Theme.of(context).textTheme.overline.copyWith(color: Colors.white),

        ),
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        buttonTheme: Theme.of(context).buttonTheme.copyWith(highlightColor: Colors.white),

        // fontFamily: "WorkSansMedium"
      ),
      //theme: CustomColors().appTheme,
      home: new SplashScreenPage(),
      //home: new IntroPage(),
      // home: new HomeItemsOneVideoController(),
      //home: ExploreContestPage(),
      debugShowCheckedModeBanner: false,


    );
  }
}
