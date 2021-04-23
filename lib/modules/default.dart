import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anglican_lagos/common/app_consts.dart';
import 'package:anglican_lagos/common/color_utility.dart';
import 'package:anglican_lagos/modules/base_stateful_guest.dart';

class DefaultPage extends StatefulWidget {
  DefaultPage({Key key}) : super(key: key);

  @override
  _DefaultPageState createState() => new _DefaultPageState();
}

class _DefaultPageState extends BaseStatefulGuest<DefaultPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: <Widget>[
      Image.asset(
        AppConsts.Bg,
        fit: BoxFit.cover,
      ),
      new Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: Text('ShufflesTV')),
        body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
            },
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    //Contents goes here
                    Text('Welcome default')
                  ],
                ),
              ),
            )),
      )
    ]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
