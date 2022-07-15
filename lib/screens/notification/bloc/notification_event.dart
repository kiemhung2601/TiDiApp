part of 'notification_bloc.dart';

class NotificationEvent {
  const NotificationEvent();
}

class LoadNotification extends NotificationEvent {
  final Person person;

  const LoadNotification({required this.person});
}
