import 'dart:async';

import 'package:anglican_lagos/common/request_tracker_model.dart';
import 'package:anglican_lagos/models/event_model.dart';
import 'package:anglican_lagos/services/event_service.dart';
import 'package:anglican_lagos/services/utility_service.dart';
import 'package:anglican_lagos/uilayouts/message_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anglican_lagos/modules/base_stateful_guest.dart';
import 'package:add_2_calendar/add_2_calendar.dart';


class UpcomingEventsPage extends StatefulWidget {
  UpcomingEventsPage({Key key}) : super(key: key);

  @override
  _UpcomingEventsPageState createState() => new _UpcomingEventsPageState();
}

class _UpcomingEventsPageState extends BaseStatefulGuest<UpcomingEventsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var events = new List<EventModel>();
  var responseModel = new RequestProgressTrackerModel<List<EventModel>>();
  var eventService = new EventService();
  var upcomingEventStreamController = new StreamController<RequestProgressTrackerModel<List<EventModel>>>();
  @override
  void dispose() {
    super.dispose();
    upcomingEventStreamController.close();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _getEvents();
  }
  Future<void> _getEvents() async {
    responseModel.status = RequestStatus.LOADING;
    upcomingEventStreamController.add(responseModel);
    responseModel = await eventService.getUpcomingEvents();
    upcomingEventStreamController.add(responseModel);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        appBar: AppBar(
            elevation: 0.0,
            title: Text('Upcoming Events')),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Center(
              child: StreamBuilder<RequestProgressTrackerModel<List<EventModel>>>(
              stream: upcomingEventStreamController.stream,
              builder: (context, snapshot) {
               return snapshot.data != null && snapshot.data.status == RequestStatus.SUCCESS ?
               new Column(
                    children:  snapshot.data.data.map((event) =>
                    new Card(
                      child: new Container(
                        padding: new EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(event.name, style: TextStyle(color: Colors.black, fontSize: 20)),
                            ),
                            new Text('Description: ', style: TextStyle(color: Colors.black54, fontSize: 18),),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: new Text(event.description, style: TextStyle(color: Colors.black),),
                            ), new Text('Location: ', style: TextStyle(color: Colors.black54, fontSize: 18),),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: new Text(event.location, style: TextStyle(color: Colors.black),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: new Row(
                                children: <Widget>[
                                  new Text('Start Date: ', style: TextStyle(color: Colors.black54, fontSize: 18),),
                                  Expanded(child: new Text(UtilityService.getFormattedDateString(event.startDate), style: TextStyle(color: Colors.black),)),
                                ],
                              ),
                            ),new Row(
                              children: <Widget>[
                                new Text('End Date: ', style: TextStyle(color: Colors.black54, fontSize: 18),),
                                Expanded(child: new Text(UtilityService.getFormattedDateString(event.endDate), style: TextStyle(color: Colors.black),)),
                              ],
                            ),
                            new FlatButton(child: Text('Add To Calendar', style: TextStyle(color: Colors.blue)), onPressed: (){
                              final Event eventCalendar = new Event(
                                title: event.name,
                                description: event.description,
                                location: event.location,
                                startDate: DateTime.parse(event.startDate),
                                endDate:  DateTime.parse(event.endDate),
                              );
                              Add2Calendar.addEvent2Cal(eventCalendar);
                            },)
                          ],
                        ),
                      ),
                    )
                    ).toList()

                ) :
               snapshot.data != null && snapshot.data.status == RequestStatus.ERROR ?
                    MessageBox(snapshot.data.message, onPressed: () => _getEvents(),)
                   :
              Container(
              height: MediaQuery.of(context).size.height,
              child:
              Center(child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(width: 20.0, height: 20.0, child: CircularProgressIndicator()),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('Loading events. Please wait...', style: TextStyle(color: Colors.black, fontSize: 16),),
                  ),
                ],
              ))
              );
              })


            )
          ),
        ),
      );
  }


}
