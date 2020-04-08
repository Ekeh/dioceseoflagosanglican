
import 'package:flutter/material.dart';

class ResourceModel{
  final String name;
  final String url;
  ResourceModel(this.name, this.url);

  static List<ResourceModel> getResources(){
    return [
      new ResourceModel('Diocesan Anthem', 'http://www.dioceseoflagos.org/diocesan-anthem/'),
      new ResourceModel('Daily Fountain', 'http://www.dioceseoflagos.org/daily_fountain/'),
      new ResourceModel('Lagoon Radio & TV', 'http://www.dioceseoflagos.org/diocesan-radio/'),
      new ResourceModel('Sermons', 'http://www.dioceseoflagos.org/sermons/'),
      new ResourceModel('Articles', 'http://www.dioceseoflagos.org/articles/'),
      new ResourceModel('Articles of Faith', 'http://www.dioceseoflagos.org/articles-of-faith/'),
      new ResourceModel('New Church Catechism', 'http://www.dioceseoflagos.org/new-church-catechism/'),
      new ResourceModel("The Apostle’s Creed", 'http://www.dioceseoflagos.org/the-apostles-creed/'),
      new ResourceModel('The Nicene Creed', 'http://www.dioceseoflagos.org/the-nicene-creed/'),
    ];
  }
}