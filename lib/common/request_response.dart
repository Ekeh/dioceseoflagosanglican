import 'package:flutter/material.dart';

class RequestResponse {
  bool status;
  dynamic data;
  RequestResponse({@required this.status, @required  this.data});
  
  @override
  String toString(){
    return 'RequestResponse{ status: "$status", data: "$data"}';
  }
}