
import 'dart:async';

import 'package:anglican_lagos/common/app_consts.dart';
import 'package:anglican_lagos/common/check_internet_connection.dart';
import 'package:anglican_lagos/common/show_custom_dialogs.dart';
import 'package:anglican_lagos/modules/my_webview.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:anglican_lagos/common/request_tracker_model.dart';
import 'package:anglican_lagos/models/user_model.dart';
import 'package:anglican_lagos/modules/base_stateful_guest.dart';
import 'package:anglican_lagos/modules/home_page.dart';
import 'package:anglican_lagos/services/video_player_service.dart';


class AppDrawerUser extends StatefulWidget {
  @override
  _AppDrawerUserState createState() => _AppDrawerUserState();
}

class _AppDrawerUserState extends BaseStatefulGuest<AppDrawerUser> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  final _userStreamController = StreamController<UserModel>.broadcast();
  ///Custom class for notifications
  ShowCustomDialogs showCustomDialogs = new ShowCustomDialogs();
  UserModel _user;
  var videoPlayerService = new VideoPlayerService();
  @override
  void initState() {
    _animationController = new AnimationController(
      vsync: this, duration: new Duration(seconds: 3),
    );
   // _refreshProfile();
    super.initState();
  }

  Future<void> _refreshProfile() async{
    _animationController.repeat();

    videoPlayerService.refreshLoginUserInformation().then((RequestProgressTrackerModel<bool> request) async{
      if(request.status == RequestStatus.COMPLETED){
        _userStreamController.add(await userManagerService.getUser());
        _animationController.reset();
      }else{
        _animationController.reset();
        _getUser();
        showCustomDialogs.showFlushbar(icon: Icons.error, context: context, message:request.message);
      }
    });

  }

  void _getUser() async{
    _animationController.repeat();
    await new Future.delayed(new Duration(seconds: 2));
    _user = await userManagerService.getUser();
    print(_user.fullName);
    _userStreamController.add(_user);
    _animationController.reset();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _userStreamController.close();
    super.dispose();
  }
   @override
  Widget build(BuildContext context){
     /* var nameList = accountName.split(" ");
     var avatar = '';
     if(nameList.length == 2){
       avatar = nameList[0].substring(0,1);
       avatar += nameList[1].substring(0,1);
     }else{
       avatar = nameList[0].substring(0,2);
     }*/
    double headerHeight = 180.0;
    return new Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the Drawer if there isn't enough vertical
          // space to fit everything.
          child:
          new ListView(
            // Important: Remove any padding from the ListView.
                 padding: EdgeInsets.zero,
                  children: [
                    Container(
                      width: double.infinity,
                      height: headerHeight,
                      padding: EdgeInsets.only(left: 20.0),
                      child:
                      new FutureBuilder<UserModel>(
                        future: userManagerService.getUser(), // async work
                        builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Center(child: new Text('Loading....'));
                            default:
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    // Image.asset('assets/member2.png'),
                                    Container(
                                        width: 50.0,
                                        height: 50.0,
                                        margin: EdgeInsets.only(bottom: 10.0, top: 20.0),
                                        decoration: new BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: new DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage('assets/logo.png')
                                            )
                                        )
                                    ),
                                    snapshot.data != null ?
                                    Text(snapshot.data.fullName, style: TextStyle(color: Colors.white)) :
                                    Text('Diocese of Lagos', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                                    snapshot.data != null ?
                                    Text(snapshot.data.email, style: TextStyle(color: Colors.white)):
                                    Text('Church of Nigeria', style: TextStyle(color: Colors.white)),
                                    snapshot.data != null ? Container() :
                                    Text('(Anglican Communion)', style: TextStyle(color: Colors.white)),


                                  ],
                                );
                          }
                        },
                      )
                      ,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/menu_bg.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    /*Stack(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height - headerHeight,
                          child: LinearGradientBackground()
                      ),

                  ],
                ),*/
                    ListTile(
                      title: new Text('Home', style: TextStyle(color: Colors.black)),
                      leading: new Icon(
                        Icons.dashboard,),
                      onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => HomePage())
                          );
                      },
                    ),
                    ListTile(
                      title: new Text(AppConsts.MENU_DIRECTORATES, style: TextStyle(color: Colors.black)),
                      leading: new Icon(
                        FontAwesomeIcons.users,),
                      onTap: () async{
                      if( await CheckInternetConnection.isNetworkAvailable()) {
                        Navigator.of(context).push(
                            new MaterialPageRoute(builder: (BuildContext context) =>  new MyWebView(title: AppConsts.MENU_DIRECTORATES, selectedUrl:  AppConsts.MENU_DIRECTORATES_URL))
                        );
                      }else{
                        showCustomDialogs.showFlushbar(
                            context: context, message: 'Please, connect to the internet and try again.');
                      }
                      },
                    ),
                    ListTile(
                      title: new Text(AppConsts.MENU_ARCH_DEACONRIES, style: TextStyle(color: Colors.black)),
                      leading: new Icon(
                        FontAwesomeIcons.users,),
                      onTap: () async{
                      if( await CheckInternetConnection.isNetworkAvailable()) {
                        Navigator.of(context).push(
                            new MaterialPageRoute(builder: (BuildContext context) =>  new MyWebView(title: AppConsts.MENU_ARCH_DEACONRIES, selectedUrl:  AppConsts.MENU_ARCH_DEACONRIES_URL))
                        );
                      }else{
                        showCustomDialogs.showFlushbar(
                            context: context, message: 'Please, connect to the internet and try again.');
                      }
                      },
                    ),
                    ListTile(
                      title: new Text(AppConsts.MENU_FIND_CHURCH, style: TextStyle(color: Colors.black)),
                      leading: new Icon(
                        FontAwesomeIcons.map,),
                      onTap: () {
                        showCustomDialogs.showFlushbar(context: context, message: 'Coming soon...');
                      },
                    ),

                    ListTile(
                      title: new Text(AppConsts.MENU_DONATIONS, style: TextStyle(color: Colors.black)),
                      leading: new Icon(
                        FontAwesomeIcons.moneyBill,),
                      onTap: () async{
                    if( await CheckInternetConnection.isNetworkAvailable()) {
                        Navigator.of(context).push(
                            new MaterialPageRoute(builder: (BuildContext context) =>  new MyWebView(title: AppConsts.MENU_DONATIONS, selectedUrl:  AppConsts.MENU_DONATIONS_URL))
                        );
                    }else{
                      showCustomDialogs.showFlushbar(
                          context: context, message: 'Please, connect to the internet and try again.');
                    }
                    },
                    ),
                    ListTile(
                      title: new Text(AppConsts.MENU_LAGOON_RADIO_TV, style: TextStyle(color: Colors.black)),
                      leading: new Icon(
                        FontAwesomeIcons.tv,),
                      onTap: () async{
                    if(await CheckInternetConnection.isNetworkAvailable()) {
                        Navigator.of(context).push(
                            new MaterialPageRoute(builder: (BuildContext context) =>  new MyWebView(title: AppConsts.MENU_LAGOON_RADIO_TV, selectedUrl:  AppConsts.MENU_LAGOON_RADIO_TV_URL))
                        );
                       }else{
                       showCustomDialogs.showFlushbar(
                       context: context, message: 'Please, connect to the internet and try again.');
                       }
                       },
                    ),
                    ListTile(
                      title: new Text(AppConsts.MENU_SOCIAL_MEDIA, style: TextStyle(color: Colors.black)),
                      leading: new Icon(
                        FontAwesomeIcons.users,),
                      onTap: () {
                        showCustomDialogs.showFlushbar(context: context, message: 'Coming soon...');
                      },
                    ),

                    ListTile(
                      title: new Text(AppConsts.MENU_CENTENARY_CITY, style: TextStyle(color: Colors.black)),
                      leading: new Icon(
                        FontAwesomeIcons.bookmark,),
                      onTap: () async{
                     if(await CheckInternetConnection.isNetworkAvailable()) {
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(builder: (BuildContext context) =>  new MyWebView(title: AppConsts.MENU_CENTENARY_CITY, selectedUrl:  AppConsts.MENU_CENTENARY_CITY_URL))
                                        );
                     }else{
                       showCustomDialogs.showFlushbar(
                           context: context, message: 'Please, connect to the internet and try again.');
                     }
                      },
                    ),
                ListTile(
                      title: new Text(AppConsts.MENU_ABOUT_THE_CHURCH, style: TextStyle(color: Colors.black)),
                      leading: new Icon(
                        FontAwesomeIcons.infoCircle,),
                      onTap: () async {
                        if(await CheckInternetConnection.isNetworkAvailable()) {
                            Navigator.of(context).push(
                                new MaterialPageRoute(builder: (BuildContext context) =>  new MyWebView(title: AppConsts.MENU_ABOUT_THE_CHURCH, selectedUrl:  AppConsts.MENU_ABOUT_THE_CHURCH_URL))
                            );
                         }else{
                         showCustomDialogs.showFlushbar(
                         context: context, message: 'Please, connect to the internet and try again.');
                         }
                       },
                    ),
                  ListTile(
                      title: new Text(AppConsts.MENU_UPCOMING_PROGRAMS, style: TextStyle(color: Colors.black)),
                      leading: new Icon(
                        FontAwesomeIcons.calendar,),
                      onTap: () {
                        showCustomDialogs.showFlushbar(context: context, message: 'Coming soon...');
                      },
                    ),
                    /*ListTile(
                      title: new Text(AppConsts.MENU_CENTENARY_CELEBRATIONS, style: TextStyle(color: Colors.black)),
                      leading: new Icon(
                        FontAwesomeIcons.users,),
                      onTap: () async {
                     if(await CheckInternetConnection.isNetworkAvailable()) {
                        Navigator.of(context).push(
                            new MaterialPageRoute(builder: (BuildContext context) =>  new MyWebView(title: AppConsts.MENU_CENTENARY_CELEBRATIONS, selectedUrl:  AppConsts.MENU_CENTENARY_CELEBRATIONS_URL))
                        );
                      }else{
                        showCustomDialogs.showFlushbar(
                        context: context, message: 'Please, connect to the internet and try again.');
                      }
                      },
                    ),*/
                ListTile(
                      title: new Text(AppConsts.MENU_WOMEN_GIRLS_ORGANIZATION, style: TextStyle(color: Colors.black)),
                      leading: new Icon(
                        FontAwesomeIcons.personBooth,),
                      onTap: () {
                        showCustomDialogs.showFlushbar(context: context, message: 'Coming soon...');
                      },
                    ),
                /*  ListTile(
                      title: new Text(AppConsts.MENU_RESOURCES, style: TextStyle(color: Colors.black)),
                      leading: new Icon(
                        FontAwesomeIcons.list,),
                      onTap: () {
                        showCustomDialogs.showFlushbar(context: context, message: 'Coming soon...');
                      },
                    ),
                    */
                    /* Divider(),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 28.0),
                      child: ListTile(
                        title: new Text('Logout',
                            style: TextStyle(color: Colors.black)),
                        leading: new Icon(
                          Icons.exit_to_app),
                        onTap: () {
                           userManagerService.logout().then((value) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => new LoginPage()), (
                                  route) => route == null
                              );
                            });
                        },
                      ),
                    ),*/
              ]
          ),

        );

  }
}