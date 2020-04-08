import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:anglican_lagos/common/app_consts.dart';
import 'package:anglican_lagos/services/base_service.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:anglican_lagos/common/check_internet_connection.dart';
import 'package:anglican_lagos/common/request_method.dart';
import 'package:anglican_lagos/common/request_response.dart';
import 'package:anglican_lagos/common/show_custom_dialogs.dart';

class RequestService extends BaseService {
  /*Future<RequestResponse> requestWithInternetAlert(
      {@required GlobalKey<ScaffoldState> scaffoldStateKey,
        @required String url,
        RequestMethod method : RequestMethod.GET,
    Map<String, String> headers, dynamic body
      }) async {

    if(!await CheckInternetConnection.isNetworkAvailable()){
      ShowCustomDialogs.showSnackBar(scaffoldStateKey: scaffoldStateKey, content: 'Please connect to the internet to complete your request.');
      return null;
    }
    try {
      dynamic response;
      var defaultHeaders = {'Content-type' : 'application/json'};
       defaultHeaders.addAll({'IsMobile' : '1'});
       var userAccessTokenModel = await userManagerService.getUserAccessToken();
       if(userAccessTokenModel != null){
         defaultHeaders.addAll({'Authorization' : 'Bearer ${userAccessTokenModel.accessToken}' });
       }

      if(headers != null){
        headers.addAll(defaultHeaders);
      }else {
        headers = defaultHeaders;
      }
      print('headers');
      print(headers);
        if(method == RequestMethod.GET){
          response = await http.get(Uri.parse(url), headers: headers);
        }else if(method == RequestMethod.POST){
          response = await http.post(Uri.parse(url), body: body, headers: headers);
        }
        if (response.statusCode == 200) {
          return RequestResponse(status: true, data: response.body);
        }
        return RequestResponse(status: false, data: response.body);

    } catch (e) {
      print(e);
      return RequestResponse(status: false, data: null);
    }
  }*/

  Future<RequestResponse> request({@required String url,
        RequestMethod method : RequestMethod.GET,
    Map<String, String> headers, dynamic body, GlobalKey<ScaffoldState> showAlertDialogScaffoldStateKey}) async {
    if(!await CheckInternetConnection.isNetworkAvailable()){
      if(showAlertDialogScaffoldStateKey != null){
        ShowCustomDialogs.showSnackBar(scaffoldStateKey: showAlertDialogScaffoldStateKey, content: 'Please connect to the internet to complete your request.');
      }
      return null;
    }
    try {
      dynamic response;
      Map<String, String> defaultHeaders = {'Content-type' : 'application/json', 'IsMobile' : '1'};
         defaultHeaders.addAll({'Authorization' : AppConsts.API_TOKEN });
      if(headers != null){
        headers.addAll(defaultHeaders);
      }else headers = defaultHeaders;

      if(method == RequestMethod.GET){
        response = await http.get(Uri.parse(url), headers: headers);
      }else if(method == RequestMethod.POST){
        response = await http.post(Uri.parse(url), body: json.encode(body), headers: headers);
      }else if(method == RequestMethod.PUT){
        response = await http.put(Uri.parse(url), body: json.encode(body), headers: headers);
      }else if(method == RequestMethod.DELETE){
        response = await http.delete(Uri.parse(url), headers: headers);
      }
      if (response.statusCode == 200) {
        return RequestResponse(status: true, data: response.body);
      }
      return RequestResponse(status: false, data: response.body);
    } catch (e) {
      print(e);
      return RequestResponse(status: false, data: null);
    }
  }

}