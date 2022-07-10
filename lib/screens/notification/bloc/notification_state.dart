part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  final NotificationStatus notificationStatus;

  const NotificationState({
    this.notificationStatus = const InitNotificationStatus(),
  });

  NotificationState updateWith({
    NotificationStatus? notificationStatus,
  }) {
    return NotificationState(
      notificationStatus: notificationStatus ?? this.notificationStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    notificationStatus,
  ];
}