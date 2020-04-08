import 'package:anglican_lagos/models/archdeaconry_model.dart';
import 'package:anglican_lagos/models/church_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anglican_lagos/common/app_consts.dart';
import 'package:anglican_lagos/common/color_utility.dart';
import 'package:anglican_lagos/modules/base_stateful_guest.dart';
import 'package:anglican_lagos/uilayouts/offline_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'find_church_map.dart';

class FindChurchPage extends StatefulWidget {
  FindChurchPage({Key key}) : super(key: key);

  @override
  _FindChurchPageState createState() => new _FindChurchPageState();
}

class _FindChurchPageState extends BaseStatefulGuest<FindChurchPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final archdeaconries = <ArchdeaconryModel>[
   new ArchdeaconryModel(
     name: "Apapa",
     churches: <ChurchModel>[
       new ChurchModel(name: "St. Andrews Anglican Church", latitude: 6.441737, longitude: 3.355047),
       new ChurchModel(name: "St. James Church Omukoko", latitude: 6.467457, longitude: 3.341926),
       new ChurchModel(name: "St. Peters Anglican Church", latitude: 6.449205, longitude: 3.349104),
       new ChurchModel(name: "St John Anglican Church Araromi", latitude: 6.701287, longitude: 3.555715),
       new ChurchModel(name: "St, Peters Anglican Church Araromi", latitude: 6.452111, longitude: 3.338651),
       new ChurchModel(name: "All Saints Church", latitude: 6.462005, longitude: 3.323802),
       new ChurchModel(name: "Christ Anglican Church Trinity", latitude: 6.515810, longitude: 3.345696),
     ]
   ),
new ArchdeaconryModel(
     name: "Epe",
     churches: <ChurchModel>[
       new ChurchModel(name: "Epe	St. Mathew Anglican Church", latitude: 6.582152, longitude: 3.978868),
       new ChurchModel(name: "St. Pauls Anglican Church", latitude: 6.675885, longitude: 4.005731),
       new ChurchModel(name: "Holy Trinity Church, Poka", latitude: 6.625158, longitude: 3.986263),
       new ChurchModel(name: "Holy Trinity Church Erasco", latitude: 6.651218, longitude: 3.391211),
       new ChurchModel(name: "Christ Anglican Church", latitude: 6.604529, longitude: 3.997269),
       new ChurchModel(name: "St, Peters Anglican Church", latitude: 6.458581, longitude: 3.188745),
     ]
   ),new ArchdeaconryModel(
     name: "Eti-Okun",
     churches: <ChurchModel>[
       new ChurchModel(name: "St. Peters Church", latitude: 6.439814, longitude: 3.883383),
       new ChurchModel(name: "St, Jmaes Anglican Church", latitude: 6.444269, longitude: 3.525946),
       new ChurchModel(name: "Christ Anglican Church", latitude: 6.436884, longitude: 3.928582),
     ]
   ),new ArchdeaconryModel(
     name: "Eti-Osa",
     churches: <ChurchModel>[
       new ChurchModel(name: "Holy Trinity", latitude: 6.464681, longitude: 3.387337),
       new ChurchModel(name: "St. John Church", latitude: 6.459912, longitude: 3.388613),
       new ChurchModel(name: "Kings Anglican Church", latitude: 6.462811, longitude: 3.389141),
       new ChurchModel(name: "St. Andrews Church", latitude: 6.456459, longitude: 3.397299),
     ]
   ),new ArchdeaconryModel(
     name: "Ifesowapo",
     churches: <ChurchModel>[
       new ChurchModel(name: "All Saints Church", latitude: 6.581411, longitude: 3.972445),
       new ChurchModel(name: "Our Saviours Church", latitude: 6.446414, longitude: 3.0400316),
       new ChurchModel(name: "All Saints Anglican Church", latitude: 6.677603, longitude: 3.985404),
       new ChurchModel(name: "St. John Church Poka", latitude: 6.606241, longitude: 3.964178),
       new ChurchModel(name: "St. John Church Odo Agbolu", latitude: 6.743371, longitude: 3.982740),
     ]
   ),new ArchdeaconryModel(
     name: "Ikoyi",
     churches: <ChurchModel>[
       new ChurchModel(name: "Our Saviours Church TBS", latitude: 6.446378, longitude: 3.400351),
       new ChurchModel(name: "St Johns Church Falomo", latitude: 6.443987, longitude: 3.420113),
       new ChurchModel(name: "Church of Nativity", latitude: 6.463364, longitude: 3.449844),
     ]
   ),new ArchdeaconryModel(
     name: "kirikiri",
     churches: <ChurchModel>[
       new ChurchModel(name: "St. Pauls Church", latitude: 6.448405, longitude: 3.310550),
       new ChurchModel(name: "St. Davids Church", latitude: 6.456842, longitude: 3.331861),
       new ChurchModel(name: "St. Barnabas Anglican Church", latitude: 6.460940, longitude: 3.335163),
       new ChurchModel(name: "St. Josephs Church Wilmer", latitude: 6.443219, longitude: 3.334602),
       new ChurchModel(name: "St. Pauls Anglican Church", latitude: 6.442934, longitude: 3.342045),
       new ChurchModel(name: "St. John's Anglican Church", latitude: 6.443149, longitude: 3.339936),
       new ChurchModel(name: "St. Pauls Anglican Church Maza", latitude: 6.483660, longitude: 3.040609),
       new ChurchModel(name: "All Saints Church Ojo", latitude: 6.468702, longitude: 3.323359),
     ]
   ),
new ArchdeaconryModel(
     name: "Lagoon",
     churches: <ChurchModel>[
       new ChurchModel(name: "Anglican Church on the Peninsula", latitude: 6.470035, longitude: 3.579042),
       new ChurchModel(name: "Anglican Church of the Beautiful Gate", latitude: 6.466632, longitude: 3.544562),
       new ChurchModel(name: "Anglican Church of Advent", latitude: 6.431453, longitude: 3.523929),
       new ChurchModel(name: "St Peters Anglican Church, Sangotedo", latitude: 6.456072, longitude: 3.550657),
       new ChurchModel(name: "St James Church, Bogije", latitude: 6.500578, longitude: 3.756484),
       new ChurchModel(name: "Anglican Church of Praise, Eputu", latitude: 6.472726, longitude: 3.722798),
     ]
   ),
new ArchdeaconryModel(
     name: "Lagos",
     churches: <ChurchModel>[
       new ChurchModel(name: "St. Pauls Church, Breadfruit", latitude: 6.455778, longitude: 3.385164),
       new ChurchModel(name: "St. Peters Church, Faji", latitude: 6.451183, longitude: 3.392261),
       new ChurchModel(name: "St. David Anglican Church, Lafiaji", latitude: 6.450462, longitude: 3.405312),
     ]
   ),
new ArchdeaconryModel(
     name: "Lekki",
     churches: <ChurchModel>[
       new ChurchModel(name: "All Souls Church", latitude: 6.443584, longitude: 3.469114),
       new ChurchModel(name: "New Era Anglican Church", latitude: 6.429196, longitude: 3.499542),
       new ChurchModel(name: "Anglican Church of Praise", latitude: 6.443846, longitude: 3.480461),
       new ChurchModel(name: "Church of Epiphany", latitude: 6.437952, longitude: 3.516739),
     ]
   ),new ArchdeaconryModel(
     name: "Marine Beach",
     churches: <ChurchModel>[
       new ChurchModel(name: "The Good Shepherd Church", latitude: 6.458359, longitude: 3.363538),
       new ChurchModel(name: "Immanuel Anglican Church", latitude: 6.457023, longitude: 3.358742),
       new ChurchModel(name: "St. Andrews Anglican Church", latitude: 6.440991, longitude: 3.354981),
       new ChurchModel(name: "Emmanuel Anglican Church", latitude: 6.523788, longitude: 3.308678),
       new ChurchModel(name: "St Andrews Church", latitude: 6.458435, longitude: 3.347843),
       new ChurchModel(name: "New Life Anglican Church", latitude: 6.466895, longitude: 3.356102),
     ]
   ),new ArchdeaconryModel(
     name: "New Era",
     churches: <ChurchModel>[
       new ChurchModel(name: "Anglican Church Of Ascension", latitude: 6.506520, longitude: 3.604392),
     ]
   ),
    new ArchdeaconryModel(
     name: "Peninsula",
     churches: <ChurchModel>[
       new ChurchModel(name: "St. Peters Anglican Church", latitude: 6.439611, longitude: 3.883388),
       new ChurchModel(name: "Anglican Church of Pentecost", latitude: 6.470253, longitude: 3.591145),
       new ChurchModel(name: "Church of Redemption", latitude: 6.436924, longitude: 3.514620),
       new ChurchModel(name: "Anglican Church of Transformation", latitude: 6.466067, longitude: 3.667962),
       new ChurchModel(name: "Church of Advent", latitude: 6.431353, longitude: 3.523887),
       new ChurchModel(name: "Anglican Church of Divine Favour", latitude: 6.471643, longitude: 3.629522),
       new ChurchModel(name: "St James Church, Ikota", latitude: 6.443526, longitude: 3.543770),
     ]
   ),new ArchdeaconryModel(
     name: "Victoria Island",
     churches: <ChurchModel>[
       new ChurchModel(name: "Church of Resurrection", latitude: 6.436901, longitude: 3.433408),
       new ChurchModel(name: "St. John Anglican Church", latitude: 6.426345, longitude: 3.421805),
       new ChurchModel(name: "Anglican Church of Living Souls", latitude: 6.428031, longitude: 3.481838),
     ]
   ),

  ];
  
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: Text('Churches')),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Center(
              child: new Column(
                children:  archdeaconries.map((archdeaconry) =>
                  new Card(
                    child: new Container(
                      padding: new EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 0.0),
                            child: Text(archdeaconry.name, style: TextStyle(color: Colors.black, fontSize: 24)),
                          ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: archdeaconry.churches.map((church) =>
                          new Row(
                            children: <Widget>[
                              Expanded(child: new Text(church.name, style: TextStyle(color: Colors.black),)),
                              new FlatButton(child: Text('View in Map', style: TextStyle(color: Colors.blue)), onPressed: (){
                                var latLng = new LatLng(church.latitude, church.longitude);
                                Navigator.of(context).push(
                                    new MaterialPageRoute(builder: (BuildContext context) =>  new FindChurchMapPage(archdeaconry: archdeaconry.name, churchName: church.name, latLng: latLng))
                                );
                              },)
                            ],
                          )).toList()

          )

                        ],
                      ),
                    ),
                  )
                  ).toList()

              ),
            )
          ),
        ),
      );
  }


}
