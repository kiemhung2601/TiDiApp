import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/screens/notification/bloc/notification_status.dart';

import '../../../fake_data/fake_data.dart';
import '../../../model/account.dart';
import '../../../model/notification.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationState()) {
    on<LoadNotification>((event, emit) {
      emit(state.updateWith(notificationStatus: const InitNotificationStatus()));
      List<Notifi> lstNotification = lstNotifi;

      emit(state.updateWith(notificationStatus: NotificationStatusSuccess(lstNotification)));
    });
  }
}
