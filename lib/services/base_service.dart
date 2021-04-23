import 'dart:async';
import 'package:anglican_lagos/services/generic_service.dart';
import 'package:anglican_lagos/services/request_service.dart';
import 'package:anglican_lagos/services/user_manager_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
class BaseService{
  SharedPreferences _sharedPreferences;
 UserManagerService get userManagerService => UserManagerService();
 RequestService get requestService => RequestService();
 GenericService get genericService => GenericService();

 Future<SharedPreferences> getSharedPreferencesInstance() async {
   if(_sharedPreferences != null)
     return _sharedPreferences;
   _sharedPreferences = await SharedPreferences.getInstance();
   return _sharedPreferences;
  }
 static bool isValidEmail(String input) {
    final RegExp regex = new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }
}