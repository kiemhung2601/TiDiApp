part of 'notification_bloc.dart';

class NotificationEvent {
  const NotificationEvent();
}

class LoadNotification extends NotificationEvent {
  final String idAccount;

  const LoadNotification({required this.idAccount});
}
