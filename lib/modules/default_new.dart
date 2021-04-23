import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anglican_lagos/common/app_consts.dart';
import 'package:anglican_lagos/common/color_utility.dart';
import 'package:anglican_lagos/modules/base_stateful_guest.dart';
import 'package:anglican_lagos/uilayouts/offline_page.dart';

class DefaultNewPage extends StatefulWidget {
  DefaultNewPage({Key key}) : super(key: key);

  @override
  _DefaultNewPageState createState() => new _DefaultNewPageState();
}

class _DefaultNewPageState extends BaseStatefulGuest<DefaultNewPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
        children: <Widget>[
    Container(
    width: double.infinity,
      height: double.infinity,
      child: Image.asset(AppConsts.Bg, fit: BoxFit.cover,),
    ),
      new Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: Text('ShufflesTV')),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //Contents goes here
              Text('Welcome default')
            ],
          ),
        ),
      ),

    ///Must be last
    new OfflinePage(),
    ]);
  }


}
