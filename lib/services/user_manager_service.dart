import 'dart:async';
import 'dart:convert';
import 'package:anglican_lagos/models/user_model.dart';
import 'package:anglican_lagos/services/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserManagerService extends BaseService {

  static const String _USER_AUTH_KEY = "user_authentication_key";
  static const String _USER_ACCESS_TOKEN_KEY = "user_access_token_key";
  static const String _PROFILE_PICTURE_KEY = "profilePicture";

  Future<void> saveUser(String userJsonString) async {
    SharedPreferences sharedPreferences = await this
        .getSharedPreferencesInstance();
    sharedPreferences.setString(_USER_AUTH_KEY, userJsonString);
  }

  Future<void> saveUserAccessToken(String userJsonString) async {
    SharedPreferences sharedPreferences = await this
        .getSharedPreferencesInstance();
    sharedPreferences.setString(_USER_ACCESS_TOKEN_KEY, userJsonString);
  }

  Future<UserModel> getUser() async {
    UserModel userModel;
    try {
      SharedPreferences sharedPreferences = await this
          .getSharedPreferencesInstance();
      String userJson = sharedPreferences.getString(_USER_AUTH_KEY);
      if (userJson != null) {
        dynamic jsonObject = json.decode(userJson);
        if (jsonObject != null) {
          userModel = UserModel.fromJson(jsonObject);
        }
      }
      return userModel;
    } catch (e) {
      print(e);
    }
    return userModel;
  }

  Future<bool> logout() async {
    SharedPreferences sharedPreferences = await this
        .getSharedPreferencesInstance();
    sharedPreferences.remove(_USER_ACCESS_TOKEN_KEY);
    sharedPreferences.remove(_USER_AUTH_KEY);
    return true;
  }

  Future<bool> isAuthenticated() async {
    var user = await this.getUser();
    return user?.userid != null;
  }

  Future<bool> saveProfilePicturePath(String path) async {
    SharedPreferences sharedPreferences = await this
        .getSharedPreferencesInstance();
    return sharedPreferences.setString(_PROFILE_PICTURE_KEY, path);
  }


}
