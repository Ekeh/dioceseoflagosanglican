import 'dart:async';

import 'package:flutter/material.dart';
import 'package:anglican_lagos/common/check_internet_connection.dart';
import 'package:anglican_lagos/common/logger.dart';
import 'package:anglican_lagos/common/show_custom_dialogs.dart';
import 'package:anglican_lagos/models/user_model.dart';
import 'package:anglican_lagos/services/generic_service.dart';
import 'package:anglican_lagos/services/request_service.dart';
import 'package:anglican_lagos/services/user_manager_service.dart';
import 'package:anglican_lagos/uilayouts/offline_page.dart';

abstract class BaseStatefulAuthorized<T extends StatefulWidget> extends State<T>{
  GenericService genericService = new GenericService();
  RequestService requestService = new RequestService();
  ShowCustomDialogs showCustomDialogs = new ShowCustomDialogs();
  Logger get logger => new Logger();
  UserManagerService userManagerService = new UserManagerService();
  UserModel user;
  bool isConnected = true;

  @override
  Widget build(BuildContext context) {
    var builtWidget = build(context);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        builtWidget,
       new OfflinePage()
      ],
    );
  }
  @override
  initState(){
    super.initState();
  }


  Future<bool> isConnectedToInternet() async{
    return await CheckInternetConnection.isNetworkAvailable();
  }
}