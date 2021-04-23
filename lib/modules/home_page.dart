import 'dart:async';
import 'dart:math';

import 'package:anglican_lagos/common/check_internet_connection.dart';
import 'package:anglican_lagos/models/resources_model.dart';
import 'package:anglican_lagos/modules/upcoming_events_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anglican_lagos/common/app_consts.dart';
import 'package:anglican_lagos/common/show_custom_dialogs.dart';
import 'package:anglican_lagos/models/user_model.dart';
import 'package:anglican_lagos/uilayouts/app_drawer_user.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'base_stateful_authorized.dart';
import 'find_church.dart';
import 'find_church_map.dart';
import 'my_webview.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

UserModel _user;

///Custom class for notifications
ShowCustomDialogs showCustomDialogs = new ShowCustomDialogs();
enum MenuType {
  LINK,
  PAGE,
  ACTION,
  NAVIGATE
}
class MenuData{
   final IconData icon;
   final String name;
   final Color color;
   final MenuType menuType;
   final String url;
   final VoidCallback onClick;

   MenuData(this.icon, this.name, this.color, this.menuType, {this.url, this.onClick});

}
class SliderData{
   final String url;
   SliderData(this.url);

}

class _HomePageState extends BaseStatefulAuthorized<HomePage>
    with TickerProviderStateMixin {

  ///
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
   var _sliderIndicatorStreamController = new StreamController<int>.broadcast();
   @override
  void initState() {
    super.initState();
    _requestPermissions();
    _getUser();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

  }

  _requestPermissions() async{
    var permissionNames = <String>[];
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.location]);
   PermissionStatus locationStatus = permissions[PermissionGroup.location];
   if(locationStatus != PermissionStatus.granted){
     permissionNames.add('Location');
   }

   if(permissionNames.length > 0){
     var msg = '';
     permissionNames.forEach((name) => msg += name + '\n');
     ShowCustomDialogs.showAlertWithMultipleActions(context: context, content: 'The permissions listed below are required for this app to function properly. '
         'Please goto the app settings in your phone and accept the permissions.\n' +
         msg, actions: <FlatButton>[

     ]);
   }
  }

  @override
  void dispose() {
    _sliderIndicatorStreamController.close();
    super.dispose();
  }
  void _getUser() async{
      _user = await userManagerService.getUser();
  }
  @override
  void deactivate() {
    super.deactivate();
  }

var _menuData =  <MenuData>[
  new MenuData(FontAwesomeIcons.infoCircle, AppConsts.MENU_ABOUT_THE_CHURCH, Colors.green[900], MenuType.LINK,
      url: AppConsts.MENU_ABOUT_THE_CHURCH_URL),
  new MenuData(FontAwesomeIcons.map, AppConsts.MENU_FIND_CHURCH, Colors.brown, MenuType.NAVIGATE),
  new MenuData(FontAwesomeIcons.users, AppConsts.MENU_DIRECTORATES,
      Colors.blue, MenuType.LINK, url: AppConsts.MENU_DIRECTORATES_URL),
  new MenuData(FontAwesomeIcons.users, AppConsts.MENU_ARCH_DEACONRIES,
      Colors.yellow[900], MenuType.LINK, url: AppConsts.MENU_ARCH_DEACONRIES_URL),
  new MenuData(FontAwesomeIcons.moneyBill, AppConsts.MENU_DONATIONS, Colors.red, MenuType.LINK,
      url: AppConsts.MENU_DONATIONS_URL),
  new MenuData(FontAwesomeIcons.tv, AppConsts.MENU_LAGOON_RADIO_TV, Colors.green, MenuType.LINK,
      url: AppConsts.MENU_LAGOON_RADIO_TV_URL),
  /*new MenuData(FontAwesomeIcons.users, AppConsts.MENU_SOCIAL_MEDIA, Colors.black, MenuType.PAGE),*/
  new MenuData(FontAwesomeIcons.bookmark, AppConsts.MENU_CENTENARY_CITY, Colors.yellow[900], MenuType.LINK,
      url: AppConsts.MENU_CENTENARY_CITY_URL),

  new MenuData(FontAwesomeIcons.calendar, AppConsts.MENU_UPCOMING_PROGRAMS, Colors.brown[900], MenuType.NAVIGATE),
 /* new MenuData(FontAwesomeIcons.users, AppConsts.MENU_CENTENARY_CELEBRATIONS, Colors.red[900], MenuType.LINK,
      url: AppConsts.MENU_CENTENARY_CELEBRATIONS_URL),*/
  new MenuData(FontAwesomeIcons.personBooth, AppConsts.MENU_WOMEN_GIRLS_ORGANIZATION, Colors.black, MenuType.PAGE),
  new MenuData(FontAwesomeIcons.list, AppConsts.MENU_RESOURCES, Colors.green[600], MenuType.ACTION),
];

var _sliders =  <SliderData>[
  new SliderData('assets/slider1.jpg'),
  new SliderData('assets/slider2.jpg'),
  new SliderData('assets/slider3.jpg'),
  new SliderData('assets/slider4.jpg'),
];

  var _rng = new Random(100);

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    print(_screenHeight);
    print(_screenWidth);
    return
      Scaffold(
          key: _scaffoldKey,
          drawer: AppDrawerUser(),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            title: Text('Diocese of Lagos'),
            elevation: 0,
          ),

          body: Container(
            color: Colors.white,
           // padding: const EdgeInsets.only(bottom: 100.0),
            child:
            Column(
          children: <Widget>[
            Stack(
                children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CarouselSlider(
                height: 200.0,
                viewportFraction: 0.9,
                autoPlay: true,
                enlargeCenterPage: true,
                pauseAutoPlayOnTouch: new Duration(seconds: 5),
                onPageChanged: (index) {
                    _sliderIndicatorStreamController.add(index);
                },
                items: _sliders.map((slider) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.asset(slider.url, fit: BoxFit.cover),
                          );
                        /*StreamBuilder<int>(
                          stream: _sliderIndicatorStreamController.stream,
                          initialData: 0,
                          builder: (context, snapshot) {
                            return snapshot.data == _sliders.indexOf(slider) ?
                              Card(
                              elevation: 4,
                              child:
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Image.asset(slider.url, fit: BoxFit.cover),
                      )
                      ) :
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Image.asset(slider.url, fit: BoxFit.cover),
                            );
                          }
                        );*/
                    },
                  );
                }).toList(),

              ),
            ),
            Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child:
                StreamBuilder<int>(
                  stream: _sliderIndicatorStreamController.stream,
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _sliders.map((slider) {
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: snapshot.data == _sliders.indexOf(slider) ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4)
                          ),
                        );
                      }).toList(),
                    );
                  }
                )
            )
          ]
            ),
            Container(
                height:  _screenHeight <= 695.0 ? _screenHeight - 295 : _screenHeight - 320,
             child: StaggeredGridView.countBuilder(
                  crossAxisCount: _screenWidth <= 600 ? 2 : 3,
                  itemCount: _menuData.length,
                  itemBuilder: (BuildContext context, int index) =>
                      InkWell(
                        onTap: () async {
                         if( _menuData[index].menuType == MenuType.LINK &&
                              _menuData[index].url.isNotEmpty) {
                        if(await CheckInternetConnection.isNetworkAvailable()) {
                          Navigator.of(context).push(
                          new MaterialPageRoute(builder: (
                          BuildContext context) =>
                          new MyWebView(
                          title: _menuData[index].name,
                          selectedUrl: _menuData[index].url))
                          );
                          }else{
                          showCustomDialogs.showFlushbar(
                              context: context, message: 'Please, connect to the internet and try again.');
                          }
                         } else if (_menuData[index].menuType == MenuType.ACTION &&
                             _menuData[index].name == AppConsts.MENU_RESOURCES){
                           _modalBottomSheetMenu();
                         } else if (_menuData[index].menuType == MenuType.NAVIGATE){
                           if( _menuData[index].name == AppConsts.MENU_FIND_CHURCH){
                             Navigator.of(context).push(new MaterialPageRoute(builder: (
                                 BuildContext context) => new FindChurchMapPage()));
                           }/*else if(_menuData[index].name == AppConsts.MENU_UPCOMING_PROGRAMS){
                             Navigator.of(context).push(new MaterialPageRoute(builder: (
                                 BuildContext context) => new UpcomingEventsPage()));
                           }*/
                         } else {
                           showCustomDialogs.showFlushbar(
                               context: context, message: 'Coming soon...');
                         }
                        },
                        child: Container(
                          height: double.parse((150 + _rng.nextInt(200 - 150)).toString()),
                          child: Card(
                              elevation: 4,
                              color: _menuData[index].color,
                              child:
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(_menuData[index].icon, color: Colors.white,size: 50,),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20.0),
                                        child: Text(_menuData[index].name, style: TextStyle(color: Colors.white),),
                                      )
                                    ]
                                ),
                              )

                          ),
                        ),
                      )
                  ,
                  staggeredTileBuilder: (int index) =>
                  new StaggeredTile.fit(1),
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                )
            ),
            ]
              ),
            )


      );


  }

   void _modalBottomSheetMenu(){
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return new Container(
            height: 550.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0)
                        )
                        ),
                child: new SingleChildScrollView(
                  child: new Column(
                    children: ResourceModel.getResources().map((item) => Container(
                      child: FlatButton(
                          child: Text(item.name, style: TextStyle(color: Colors.black),),
                          onPressed: () async {
                            if( await CheckInternetConnection.isNetworkAvailable()) {
                              Navigator.of(context).push(
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                      new MyWebView(
                                          title: item.name,
                                          selectedUrl: item.url))
                              );
                            }else{
                              showCustomDialogs.showFlushbar(
                                  context: context, message: 'Please, connect to the internet and try again.');
                            }
                          }
                      ),
                    )).toList(),
                  )
                ) ),
          );
        }
    );
  }



}

