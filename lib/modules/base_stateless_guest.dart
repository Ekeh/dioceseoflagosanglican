import 'package:flutter/material.dart';
import 'package:anglican_lagos/common/check_internet_connection.dart';
import 'package:anglican_lagos/common/logger.dart';
import 'package:anglican_lagos/services/generic_service.dart';
import 'package:anglican_lagos/services/request_service.dart';
import 'package:anglican_lagos/services/user_manager_service.dart';

abstract class BaseStatelessGuest extends StatelessWidget{
  final GenericService genericService = GenericService();
  final UserManagerService userManagerService = UserManagerService();
  final RequestService requestService = RequestService();
  Logger get logger => Logger();

  @override
  Widget build(BuildContext context) {
    return build(context);
  }
  Future<bool> isConnectedToInternet() async{
    return await CheckInternetConnection.isNetworkAvailable();
  }
}