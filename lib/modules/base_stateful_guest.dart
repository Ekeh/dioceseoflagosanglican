import 'dart:async';

import 'package:flutter/material.dart';
import 'package:anglican_lagos/common/check_internet_connection.dart';
import 'package:anglican_lagos/common/logger.dart';
import 'package:anglican_lagos/common/show_custom_dialogs.dart';
import 'package:anglican_lagos/services/generic_service.dart';
import 'package:anglican_lagos/services/request_service.dart';
import 'package:anglican_lagos/services/user_manager_service.dart';

abstract class BaseStatefulGuest<T extends StatefulWidget> extends State<T>{
  GenericService get genericService => GenericService();
  RequestService get requestService => RequestService();
  ShowCustomDialogs showCustomDialogs = new ShowCustomDialogs();
  UserManagerService get userManagerService => UserManagerService();
  bool isConnected = true;
  Logger get logger => Logger();

  @override
  Widget build(BuildContext context) {
    return build(context);
  }

 Future<bool> isConnectedToInternet() async{
     return await CheckInternetConnection.isNetworkAvailable();
  }
}