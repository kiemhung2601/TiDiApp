
import '../../../model/notification.dart';
import '../../../network/custom_exception.dart';

abstract class NotificationStatus {
  const NotificationStatus();
}

class InitNotificationStatus extends NotificationStatus {
  const InitNotificationStatus();
}

class NotificationStatusFail extends NotificationStatus {
  final ResponseError responseError;

  NotificationStatusFail(this.responseError);
}

class NotificationStatusSuccess extends NotificationStatus {
  final List<Notifi> lstNotification;

  NotificationStatusSuccess(this.lstNotification,);

  // TODO: implement props
  List<Object?> get props => [lstNotification];
}