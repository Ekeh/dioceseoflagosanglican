import 'dart:async';
import 'dart:convert';
import 'package:anglican_lagos/common/request_method.dart';
import 'package:anglican_lagos/common/request_tracker_model.dart';
import 'package:anglican_lagos/services/api_requests_uri.dart';
import 'package:anglican_lagos/services/base_service.dart';

class VideoPlayerService extends BaseService{

  Future<RequestProgressTrackerModel<bool>> refreshLoginUserInformation() async {
    var responseTracker = new RequestProgressTrackerModel<bool>();
    var url = ApiRequestsUri.REFRESH_PROFILE;
    var user = await userManagerService.getUser();
    Map<String, String> body = {'userid' : '${user.userid}'};
    var response = await requestService.request(url: url, body: body, method: RequestMethod.POST);
    if(response != null && response.data != null){
      var item = json.decode(response.data);
      if(item['success']){
        await userManagerService.saveUser(json.encode(item['data']['user']));
        responseTracker.status = RequestStatus.COMPLETED;
      }else{
        responseTracker.status = RequestStatus.ERROR;
      }

      responseTracker.message = item['message'];
    }else{
      responseTracker.status = RequestStatus.ERROR;
      responseTracker.message = 'Error occurred while refreshing profile. Please ensure you are connected to the internet.';
    }

    return responseTracker;
  }

}



