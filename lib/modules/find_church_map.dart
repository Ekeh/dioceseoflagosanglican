import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:anglican_lagos/models/church_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anglican_lagos/modules/base_stateful_guest.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindChurchMapPage extends StatefulWidget {
  /*final LatLng latLng;
  final String archdeaconry;
  final String churchName;*/
 
  /*FindChurchMapPage({@required this.archdeaconry, @required this.churchName, @required this.latLng}) :
        assert(archdeaconry != null),assert(churchName != null), assert(latLng != null);*/

  @override
  _FindChurchMapPageState createState() => new _FindChurchMapPageState();
}

class _FindChurchMapPageState extends BaseStatefulGuest<FindChurchMapPage>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var churches = <ChurchModel>[
    new ChurchModel(name: "St. Andrews Anglican Church", archdeaconry: 'Apapa', latitude: 6.441737, longitude: 3.355047),
    new ChurchModel(name: "St. James Church Omukoko", archdeaconry: 'Apapa', latitude: 6.467457, longitude: 3.341926),
    new ChurchModel(name: "St. Peters Anglican Church", archdeaconry: 'Apapa', latitude: 6.449205, longitude: 3.349104),
    new ChurchModel(name: "St John Anglican Church Araromi", archdeaconry: 'Apapa', latitude: 6.701287, longitude: 3.555715),
    new ChurchModel(name: "St, Peters Anglican Church Araromi", archdeaconry: 'Apapa', latitude: 6.452111, longitude: 3.338651),
    new ChurchModel(name: "All Saints Church", archdeaconry: 'Apapa', latitude: 6.462005, longitude: 3.323802),
    new ChurchModel(name: "Christ Anglican Church Trinity", archdeaconry: 'Apapa', latitude: 6.515810, longitude: 3.345696),
    new ChurchModel(name: "Epe	St. Mathew Anglican Church", archdeaconry: 'Epe', latitude: 6.582152, longitude: 3.978868),
    new ChurchModel(name: "St. Pauls Anglican Church", archdeaconry: 'Epe', latitude: 6.675885, longitude: 4.005731),
    new ChurchModel(name: "Holy Trinity Church, Poka", archdeaconry: 'Epe', latitude: 6.625158, longitude: 3.986263),
    new ChurchModel(name: "Holy Trinity Church Erasco", archdeaconry: 'Epe', latitude: 6.651218, longitude: 3.391211),
    new ChurchModel(name: "Christ Anglican Church", archdeaconry: 'Epe', latitude: 6.604529, longitude: 3.997269),
    new ChurchModel(name: "St, Peters Anglican Church", archdeaconry: 'Epe', latitude: 6.458581, longitude: 3.188745),
    new ChurchModel(name: "St. Peters Church", archdeaconry: 'Eti-Okun',  latitude: 6.439814, longitude: 3.883383),
    new ChurchModel(name: "St, Jmaes Anglican Church", archdeaconry: 'Eti-Okun',  latitude: 6.444269, longitude: 3.525946),
    new ChurchModel(name: "Christ Anglican Church", archdeaconry: 'Eti-Okun',  latitude: 6.436884, longitude: 3.928582),
    new ChurchModel(name: "Holy Trinity", archdeaconry: 'Eti-Osa',  latitude: 6.464681, longitude: 3.387337),
    new ChurchModel(name: "St. John Church", archdeaconry: 'Eti-Osa', latitude: 6.459912, longitude: 3.388613),
    new ChurchModel(name: "Kings Anglican Church", archdeaconry: 'Eti-Osa', latitude: 6.462811, longitude: 3.389141),
    new ChurchModel(name: "St. Andrews Church", archdeaconry: 'Eti-Osa', latitude: 6.456459, longitude: 3.397299),
    new ChurchModel(name: "All Saints Church", archdeaconry: 'Ifesowapo', latitude: 6.581411, longitude: 3.972445),
    new ChurchModel(name: "Our Saviours Church", archdeaconry: 'Ifesowapo', latitude: 6.446414, longitude: 3.0400316),
    new ChurchModel(name: "All Saints Anglican Church", archdeaconry: 'Ifesowapo', latitude: 6.677603, longitude: 3.985404),
    new ChurchModel(name: "St. John Church Poka", archdeaconry: 'Ifesowapo', latitude: 6.606241, longitude: 3.964178),
    new ChurchModel(name: "St. John Church Odo Agbolu", archdeaconry: 'Ifesowapo', latitude: 6.743371, longitude: 3.982740),
    new ChurchModel(name: "Our Saviours Church TBS", archdeaconry: 'Ikoyi', latitude: 6.446378, longitude: 3.400351),
    new ChurchModel(name: "St Johns Church Falomo", archdeaconry: 'Ikoyi', latitude: 6.443987, longitude: 3.420113),
    new ChurchModel(name: "Church of Nativity", archdeaconry: 'Ikoyi', latitude: 6.463364, longitude: 3.449844),
    new ChurchModel(name: "St. Pauls Church", archdeaconry: 'kirikiri', latitude: 6.448405, longitude: 3.310550),
    new ChurchModel(name: "St. Davids Church", archdeaconry: 'kirikiri', latitude: 6.456842, longitude: 3.331861),
    new ChurchModel(name: "St. Barnabas Anglican Church", archdeaconry: 'kirikiri', latitude: 6.460940, longitude: 3.335163),
    new ChurchModel(name: "St. Josephs Church Wilmer", archdeaconry: 'kirikiri', latitude: 6.443219, longitude: 3.334602),
    new ChurchModel(name: "St. Pauls Anglican Church", archdeaconry: 'kirikiri', latitude: 6.442934, longitude: 3.342045),
    new ChurchModel(name: "St. John's Anglican Church", archdeaconry: 'kirikiri', latitude: 6.443149, longitude: 3.339936),
    new ChurchModel(name: "St. Pauls Anglican Church Maza", archdeaconry: 'kirikiri', latitude: 6.483660, longitude: 3.040609),
    new ChurchModel(name: "All Saints Church Ojo", archdeaconry: 'kirikiri', latitude: 6.468702, longitude: 3.323359),
    new ChurchModel(name: "Anglican Church on the Peninsula", archdeaconry: 'Lagoon', latitude: 6.470035, longitude: 3.579042),
    new ChurchModel(name: "Anglican Church of the Beautiful Gate", archdeaconry: 'Lagoon', latitude: 6.466632, longitude: 3.544562),
    new ChurchModel(name: "Anglican Church of Advent", archdeaconry: 'Lagoon', latitude: 6.431453, longitude: 3.523929),
    new ChurchModel(name: "St Peters Anglican Church, Sangotedo", archdeaconry: 'Lagoon', latitude: 6.456072, longitude: 3.550657),
    new ChurchModel(name: "St James Church, Bogije", archdeaconry: 'Lagoon', latitude: 6.500578, longitude: 3.756484),
    new ChurchModel(name: "Anglican Church of Praise, Eputu", archdeaconry: 'Lagoon', latitude: 6.472726, longitude: 3.722798),
    new ChurchModel(name: "St. Pauls Church, Breadfruit", archdeaconry: 'Lagos', latitude: 6.455778, longitude: 3.385164),
    new ChurchModel(name: "St. Peters Church, Faji", archdeaconry: 'Lagos', latitude: 6.451183, longitude: 3.392261),
    new ChurchModel(name: "St. David Anglican Church, Lafiaji", archdeaconry: 'Lagos', latitude: 6.450462, longitude: 3.405312),
    new ChurchModel(archdeaconry: 'Lekki', name: "All Souls Church", latitude: 6.443584, longitude: 3.469114),
    new ChurchModel(archdeaconry: 'Lekki', name: "New Era Anglican Church", latitude: 6.429196, longitude: 3.499542),
    new ChurchModel(archdeaconry: 'Lekki', name: "Anglican Church of Praise", latitude: 6.443846, longitude: 3.480461),
    new ChurchModel(archdeaconry: 'Lekki', name: "Church of Epiphany", latitude: 6.437952, longitude: 3.516739),
    new ChurchModel(archdeaconry: 'Marine Beach', name: "The Good Shepherd Church", latitude: 6.458359, longitude: 3.363538),
    new ChurchModel(archdeaconry: 'Marine Beach', name: "Immanuel Anglican Church", latitude: 6.457023, longitude: 3.358742),
    new ChurchModel(archdeaconry: 'Marine Beach', name: "St. Andrews Anglican Church", latitude: 6.440991, longitude: 3.354981),
    new ChurchModel(archdeaconry: 'Marine Beach', name: "Emmanuel Anglican Church", latitude: 6.523788, longitude: 3.308678),
    new ChurchModel(archdeaconry: 'Marine Beach', name: "St Andrews Church", latitude: 6.458435, longitude: 3.347843),
    new ChurchModel(archdeaconry: 'Marine Beach', name: "New Life Anglican Church", latitude: 6.466895, longitude: 3.356102),
    new ChurchModel(archdeaconry: 'New Era', name: "Anglican Church Of Ascension", latitude: 6.506520, longitude: 3.604392),
    new ChurchModel(archdeaconry: 'Peninsula', name: "St. Peters Anglican Church", latitude: 6.439611, longitude: 3.883388),
    new ChurchModel(archdeaconry: 'Peninsula', name: "Anglican Church of Pentecost", latitude: 6.470253, longitude: 3.591145),
    new ChurchModel(archdeaconry: 'Peninsula', name: "Church of Redemption", latitude: 6.436924, longitude: 3.514620),
    new ChurchModel(archdeaconry: 'Peninsula', name: "Anglican Church of Transformation", latitude: 6.466067, longitude: 3.667962),
    new ChurchModel(archdeaconry: 'Peninsula', name: "Church of Advent", latitude: 6.431353, longitude: 3.523887),
    new ChurchModel(archdeaconry: 'Peninsula', name: "Anglican Church of Divine Favour", latitude: 6.471643, longitude: 3.629522),
    new ChurchModel(archdeaconry: 'Peninsula', name: "St James Church, Ikota", latitude: 6.443526, longitude: 3.543770),
    new ChurchModel(archdeaconry: 'Victoria Island', name: "Church of Resurrection", latitude: 6.436901, longitude: 3.433408),
    new ChurchModel(archdeaconry: 'Victoria Island', name: "St. John Anglican Church", latitude: 6.426345, longitude: 3.421805),
    new ChurchModel(archdeaconry: 'Victoria Island', name: "Anglican Church of Living Souls", latitude: 6.428031, longitude: 3.481838),

  ];


  GoogleMapController mapController;
  var markers = <MarkerId, Marker>{};
  Position currentPosition;
  //var currentLocation = new LatLng(6.426345, 3.421805); //Lagos
  var currentLocation = new LatLng(6.5486801,3.1846662); //Lagos
  var cameraPosition = new LatLng(6.5486801,3.1846662); //Lagos
  var zoomMap = 10.0; //Lagos
  var churchesAroundLocation = <ChurchModel>[];
  var _mapReloadStreamController = new StreamController<bool>.broadcast();
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.moveCamera(CameraUpdate.newLatLng(currentLocation));
    _mapReloadStreamController.add(true);
  }

  @override
  void dispose() {
    super.dispose();
    _mapReloadStreamController.close();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    churchesAroundLocation = churches.where((church) => church.latitude <= currentLocation.latitude &&
       church.longitude <= currentLocation.longitude).toList();
    print('default churches: ${churches.length}');
    print('churches in default location: ${churchesAroundLocation.length}');

    _getCurrentLocation();
    _buildMarkers();
  }

  void _getCurrentLocation() async{
    currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if(currentPosition != null) {
      currentLocation = new LatLng(currentPosition.latitude, currentPosition.longitude);
      churchesAroundLocation = churches.where((church) => church.latitude <= currentLocation.latitude &&
          church.longitude <= currentLocation.longitude).toList();
      _buildMarkers();
    }
  }

  static final Random _random = Random.secure();

  static String createCryptoRandomString([int length = 32]) {
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values);
  }

  void _buildMarkers(){
    markers.clear();
    churchesAroundLocation.forEach((church) {
      var markerIdVal = createCryptoRandomString();
      final MarkerId markerId = MarkerId(markerIdVal);
      var latLng = new LatLng(church.latitude, church.longitude);
      // creating a new MARKER
      final Marker marker = Marker(
        markerId: markerId,
        position: latLng,
        infoWindow: InfoWindow(title: church.name, snippet: church.archdeaconry),
        onTap: () {
          //_onMarkerTapped(markerId);
        },
      );
      markers[markerId] = marker;

    });
    if(churchesAroundLocation.length > 0) {
      zoomMap = 11.0;
      //var middleChurch = _getMiddleLatLng();
      cameraPosition = currentLocation;
      _mapReloadStreamController.add(true);
    }
   // print('churchesAroundLocation $churchesAroundLocation');

  }

  ChurchModel _getMiddleLatLng(){
    int startIndex = 0;
    int lastIndex = churchesAroundLocation.length - 1;
   int mid = ((startIndex + lastIndex) / 2).ceil();
   print('mid: $mid');
   return churchesAroundLocation[mid];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        /*new Scaffold(
          backgroundColor: Colors.transparent,
          key: _scaffoldKey,
          appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Color(0x00000000),
              //toolbarOpacity: 0.0,
              title: Text('Churches Around You')),
          body:  new Container(
            color: Colors.transparent,
          ),
        ),*/
        new StreamBuilder<bool>(
            stream: _mapReloadStreamController.stream,
            initialData: false,
            builder: (context, snapshot) {
              return GoogleMap(
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: currentLocation,
                  zoom: zoomMap,
                ),
                markers: Set<Marker>.of(markers.values),
              );
            }),
      /*  Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 72.0),
              child: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}))
        ],)*/
    ]);
  }
}
