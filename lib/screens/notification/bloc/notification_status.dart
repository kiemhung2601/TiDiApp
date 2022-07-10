
import '../../../model/notification.dart';

abstract class NotificationStatus {
  const NotificationStatus();
}

class InitNotificationStatus extends NotificationStatus {
  const InitNotificationStatus();
}

// class AddFavProductStatusFail extends InformationStatus {
//   final ResponseError? responseError;
//
//   AddFavProductStatusFail({this.responseError});
//
//   List<Object?> get props => [responseError];
// }

class NotificationStatusSuccess extends NotificationStatus {
  final List<Notifi> lstNotification;

  NotificationStatusSuccess(this.lstNotification,);

  // TODO: implement props
  List<Object?> get props => [lstNotification];
}