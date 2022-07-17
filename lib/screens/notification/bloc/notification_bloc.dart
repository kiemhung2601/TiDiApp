import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:socialworkapp/repository/repos.dart';
import 'package:socialworkapp/screens/notification/bloc/notification_status.dart';
import 'package:dio/dio.dart';

import '../../../model/notification.dart';
import '../../../network/custom_exception.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState()) {
    on<LoadNotification>((event, emit) async {
      try{
        emit(state.updateWith(notificationStatus: const InitNotificationStatus()));
        List<Notifi> lstNotifi = [];

        final result = await ApiRepository.notificationRepo.getListNotification(event.idAccount);

        if (result.data['status'] == 1){
          for (int i = 0; i < result.data['data'].length; i++) {
            lstNotifi.add(Notifi.fromJson(result.data['data'][i]));
          }
          emit(state.updateWith(notificationStatus: NotificationStatusSuccess(lstNotifi)));
        } else{
          emit(state.updateWith(
              notificationStatus: NotificationStatusFail(ResponseError(errorCode: result.data['status'].toString(), message: result.data['msg']))));
        }
      } on DioError catch(e){
          emit(state.updateWith(
              notificationStatus: NotificationStatusFail(
                  DioExceptions.fromDioError(e).responseError)));
      }
    });
  }
}
