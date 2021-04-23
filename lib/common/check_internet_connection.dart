import 'dart:async';
import 'package:connectivity/connectivity.dart';

class CheckInternetConnection{
  static Future<bool> isNetworkAvailable() async {
    /* try {
       final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }*/
      var connectivityResult = await (new Connectivity().checkConnectivity());
      return connectivityResult != ConnectivityResult.none;

     /* if (connectivityResult == ConnectivityResult.mobile) {
        // I am connected to a mobile network.
      } else if (connectivityResult == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
      } */

  }
  static Future<ConnectivityResult> getConnection() async {
      var connectivityResult = await (new Connectivity().checkConnectivity());
      return connectivityResult;
  }
}