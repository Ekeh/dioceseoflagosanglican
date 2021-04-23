enum RequestStatus {
  LOADING, ERROR, COMPLETED, SUCCESS
}
class RequestProgressTrackerModel<T>{
      RequestStatus status;
      String message;
      T data;
}