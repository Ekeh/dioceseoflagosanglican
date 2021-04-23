import 'dart:async';
import 'package:anglican_lagos/common/saved_data_types.dart';
import 'package:anglican_lagos/services/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GenericService extends BaseService{
    static const String SYNC_DATA_KEY = "sync_data_key";
    static const String INTRO_PAGE_KEY = "intro_page_key";
   Future<Null> save(dynamic jsonObject, SavedDataType savedDataType) async{
     this.getSharedPreferencesInstance().then((SharedPreferences sharedPreferences){
       sharedPreferences.setString(savedDataType.toString(), jsonObject.toString());
     });
  }

  Future<Null> setDataSynced(dynamic data) async{
    this.getSharedPreferencesInstance().then((SharedPreferences sharedPreferences){
      sharedPreferences.setString(SYNC_DATA_KEY, data.toString());
    });

  }

Future<String> getDataSynced() async {
  try {
    SharedPreferences sharedPreferences =  await this.getSharedPreferencesInstance();
      var sync = sharedPreferences.getString(SYNC_DATA_KEY);
      print('generic service synced: ' + sync);
      return sync;

} catch (e) {
  print(e);
  return null;
}
}
Future<void> setIntroPageView() async {
  this.getSharedPreferencesInstance().then((SharedPreferences sharedPreferences){
    sharedPreferences.setBool(INTRO_PAGE_KEY, true);
  });
}
Future<bool> getIntroPageView() async {
    SharedPreferences sharedPreferences =  await this.getSharedPreferencesInstance();
    var sync = sharedPreferences.getBool(INTRO_PAGE_KEY);
    return sync != null;

}

}



