import 'package:flutter/material.dart';

class UserModel{
      int userid;
     String email;
     String fname;
     String lname;
     String phone;
     double credit;
     String activationStatus;

     String get fullName => '$fname $lname';

     UserModel({
       @required this.userid,
       @required this.email,
       @required this.fname,
       @required this.lname,
       @required this.phone,
       @required this.credit,
       @required this.activationStatus
     });


     UserModel.fromJson(Map<String, dynamic> item):
           userid = int.parse(item['userid']),
           email = item['email'],
           fname = item['fname'],
           lname = item['lname'],
           phone = item['phone'],
           credit = double.parse(item['credit']),
           activationStatus = item['activation_status'];

  Map<String, dynamic> toJson() =>
    {
   'userid' : userid,
  'email' : email,
  'fname' : fname,
  'lname' : lname,
  'phone' : phone,
  'credit' : credit,
  'activation_status' : activationStatus
    };

} 