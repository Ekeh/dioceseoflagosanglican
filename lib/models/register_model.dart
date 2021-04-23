import 'package:flutter/material.dart';

class RegisterModel{
     String nickName;
     String phoneNumber;
     String emailAddress;
     int countryId;
     int stateId;
     String password;

     RegisterModel({
    @required this.nickName,
    @required this.phoneNumber,
     @required this.emailAddress,
     @required this.countryId,
     @required this.password,
     @required this.stateId,
  });

     RegisterModel.fromJson(Map<String, dynamic> item):
            nickName = item['nickName'],
            phoneNumber =item['phoneNumber'],
            emailAddress =item['emailAddress'],
            countryId =item['countryId'],
            stateId = item['stateId'],
            password = item['password'];

  Map<String, dynamic> toJson() =>
    {
  'nickName' : nickName,
  'phoneNumber' : phoneNumber,
  'emailAddress' : emailAddress,
  'countryId' : countryId,
  'stateId' : stateId,
  'password' : password
    };

}