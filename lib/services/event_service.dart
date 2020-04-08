import 'dart:async';
import 'dart:convert';
import 'package:anglican_lagos/common/request_tracker_model.dart';
import 'package:anglican_lagos/models/event_model.dart';
import 'package:anglican_lagos/services/api_requests_uri.dart';
import 'package:anglican_lagos/services/base_service.dart';

class EventService extends BaseService{

  Future<RequestProgressTrackerModel<List<EventModel>>> getUpcomingEvents() async {
    var responseTracker = new RequestProgressTrackerModel<List<EventModel>>();
    var url = ApiRequestsUri.UpcomingEvents;
    var response = await requestService.request(url: url);
    if(response != null && response.data != null){
      var item = json.decode(response.data);
      print(item);
      if(item['success']){
        responseTracker.data = (item['data'] as List).map((model) => EventModel.fromJson(model)).toList();
        responseTracker.status = RequestStatus.SUCCESS;
      }else{
        responseTracker.status = RequestStatus.ERROR;
        responseTracker.message = item['message'];
      }
    }else{
      responseTracker.status = RequestStatus.ERROR;
      responseTracker.message = 'Error occurred while fetching data. Please ensure you are connected to the internet.';
    }
    return responseTracker;
  }

}



