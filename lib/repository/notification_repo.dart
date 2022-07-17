import '../network/api_services.dart';

abstract class NotificationRepo {
  Future getListNotification(String userId);
}

class NotificationRepoImpl extends NotificationRepo {
  final ApiServices _apiServices;

  NotificationRepoImpl(this._apiServices);

  @override
  Future getListNotification(String userId) {
    return _apiServices.getListNotification(userId);
  }

}