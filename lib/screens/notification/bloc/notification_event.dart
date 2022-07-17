part of 'notification_bloc.dart';

class NotificationEvent {
  const NotificationEvent();
}

class LoadNotification extends NotificationEvent {
  final UserApp person;

  const LoadNotification({required this.person});
}
