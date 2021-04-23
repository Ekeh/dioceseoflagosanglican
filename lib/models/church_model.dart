import 'package:flutter/material.dart';

class ChurchModel{
     String name;
     String archdeaconry;
     double latitude;
     double longitude;
     ChurchModel({
       @required this.name,
       @required this.archdeaconry,
       @required this.latitude,
       @required this.longitude,
     }): assert(name != null), assert(latitude != null),assert(longitude != null),assert(archdeaconry != null);
} 