part of 'notification_bloc.dart';

class NotificationEvent {
  const NotificationEvent();
}

class LoadNotification extends NotificationEvent {
  final Account account;

  const LoadNotification({required this.account});
}
