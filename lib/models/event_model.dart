import 'package:flutter/material.dart';

class EventModel{
      int id;
     String name;
     String description;
     String location;
     String startDate;
     String endDate;

     EventModel({
       @required this.id,
       @required this.name,
       @required this.description,
       @required this.location,
       @required this.startDate,
       @required this.endDate
     });

     EventModel.fromJson(Map<String, dynamic> item):
           id = item['id'],
           name = item['name'],
           description = item['description'],
           location = item['location'],
           startDate = item['startDate'],
           endDate = item['endDate'];

  Map<String, dynamic> toJson() =>
    {
       'id' : id,
       'name' : name,
       'description' : description,
       'location' : location,
       'startDate' : startDate,
        'endDate' : endDate
    };

} 