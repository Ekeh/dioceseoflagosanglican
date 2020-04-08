import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anglican_lagos/modules/base_stateful_guest.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindChurchMapPage extends StatefulWidget {
  final LatLng latLng;
  final String archdeaconry;
  final String churchName;
  FindChurchMapPage({@required this.archdeaconry, @required this.churchName, @required this.latLng}) :
        assert(archdeaconry != null),assert(churchName != null), assert(latLng != null);

  @override
  _FindChurchMapPageState createState() => new _FindChurchMapPageState();
}

class _FindChurchMapPageState extends BaseStatefulGuest<FindChurchMapPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

  }
  static final Random _random = Random.secure();

  static String createCryptoRandomString([int length = 32]) {
    var values = List<int>.generate(length, (i) => _random.nextInt(256));

    return base64Url.encode(values);
  }
  @override
  Widget build(BuildContext context) {
    var markerIdVal = createCryptoRandomString();
    final MarkerId markerId = MarkerId(markerIdVal);
    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: widget.latLng,
      infoWindow: InfoWindow(title: widget.churchName, snippet: widget.archdeaconry),
      onTap: () {
        //_onMarkerTapped(markerId);
      },
    );
    markers[markerId] = marker;
    return new Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: Text(widget.churchName)),
        body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: widget.latLng,
              zoom: 16.0,
            ),
          markers: Set<Marker>.of(markers.values),
        ),
      );
  }


}
