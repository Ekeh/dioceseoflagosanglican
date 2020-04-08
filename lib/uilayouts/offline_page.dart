import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
//typedef Connectivity onConnectivityChanged();

class OfflinePage extends StatefulWidget {
  final Function(ConnectivityResult connectivity) onConnectivityChanged;
  const OfflinePage({Key key, this.onConnectivityChanged}) : super(key: key);
  @override
  _OfflinePageState createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> with TickerProviderStateMixin {
  AnimationController _animationController;
  var _hideOnlineStreamController = StreamController<bool>.broadcast();
int _isOnlineCalledCounter = 0;
  @override
  void initState() {
    // TODO: implement initState
  _animationController =
  new AnimationController(vsync: this, duration: Duration(seconds: 1));
  _animationController.repeat();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    _hideOnlineStreamController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return new OfflineBuilder(
      connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
          ) {
        final bool connected = connectivity != ConnectivityResult.none;
       if(widget.onConnectivityChanged != null){
         widget.onConnectivityChanged(connectivity);
       }

        var networkContainer = !connected ? new Container(
         // padding:  EdgeInsets.only(top: _screenHeight / 2),
          margin:  const EdgeInsets.only(top: 200.0),
          height: 30.0,
          width: 100.0,
          decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Color(0x55000000)),
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0))
          ),
          child: FadeTransition(
            opacity: _animationController,
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
               children: <Widget>[
                  Icon(Icons.signal_wifi_off, color: Colors.red,),
                  SizedBox(width: 5.0,),
                  Text('OFFLINE', style: TextStyle(fontSize: 16.0, color: Colors.red),),
              ],
            ),
                )),
          )
          ,
        )
            :

            ///When online delay for 5mins and hide online
        StreamBuilder<bool>(
            stream: _hideOnlineStreamController.stream,
            initialData: false,
            builder: (context, isVisibleSnapshot) {
              var innerContainer =
              (!isVisibleSnapshot.data) ?

                  ///At first load connectivityBuilder is called twice.
              ///The online box should not show immediately the app is launched
              _isOnlineCalledCounter <= 2 ? Container() :
              new Container(

                // padding:  EdgeInsets.only(top: _screenHeight / 2),
                margin: const EdgeInsets.only(top: 200.0),
                height: 30.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: Colors.green, //border: Border.all(),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))
                ),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.check_box, color: Colors.white,),
                          SizedBox(width: 5.0,),
                          Text('ONLINE', style: TextStyle(
                              fontSize: 16.0, color: Colors.white),),
                        ],
                      ),
                    ))
                ,
              ) : Container();

            return innerContainer;
            }
        );
        if(connected){
          Future.delayed(Duration(seconds: 5), () => _hideOnlineStreamController.add(true));
        }
        _isOnlineCalledCounter++;
        return networkContainer;
      },
      child: Container(),

    );
  }
}
