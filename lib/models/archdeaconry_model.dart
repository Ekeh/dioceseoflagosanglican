import 'package:flutter/material.dart';

import 'church_model.dart';

class ArchdeaconryModel{
     String name;
     List<ChurchModel> churches;
     ArchdeaconryModel({
       @required this.name,
       @required this.churches,
     }): assert(name != null),assert(churches != null);
} 