import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:socialworkapp/repository/repos.dart';
import 'package:socialworkapp/screens/history/bloc/history_status.dart';
import 'package:dio/dio.dart';

import '../../../model/history.dart';
import '../../../network/custom_exception.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(const HistoryState()) {
    on<LoadHistory>((event, emit) async {
      try {
        emit(state.updateWith(historyStatus: const InitHistoryStatus()));
        List<History> lstHistory = [];
        List<History> finalLstHistory = [];

        final result =
            await ApiRepository.historyRepo.getListHistory(event.idAccount);

        if (result.data['status'] == 1) {
          for (int i = 0; i < result.data['data'].length; i++) {
            finalLstHistory.add(History.fromJson(result.data['data'][i]));
          }
          debugPrint(jsonEncode(finalLstHistory));
          if (event.type == null) {
            lstHistory = finalLstHistory;
          } else if (event.type == 0) {
            for (int i = 0; i < finalLstHistory.length; i++) {
              if (finalLstHistory[i].status == 0) {
                lstHistory.add(finalLstHistory[i]);
              }
            }
          } else if (event.type == 1) {
            for (int i = 0; i < finalLstHistory.length; i++) {
              if (finalLstHistory[i].status == 1) {
                lstHistory.add(finalLstHistory[i]);
              }
            }
          } else if (event.type == 2) {
            for (int i = 0; i < finalLstHistory.length; i++) {
              if (finalLstHistory[i].status == 2) {
                lstHistory.add(finalLstHistory[i]);
              }
            }
          }

          emit(state.updateWith(
              historyStatus: HistoryStatusSuccess(lstHistory)));
        } else {
          emit(state.updateWith(
              historyStatus: HistoryStatusFail(ResponseError(
                  errorCode: result.data['status'].toString(),
                  message: result.data['msg']))));
        }
      } on DioError catch (e) {
        emit(state.updateWith(
            historyStatus: HistoryStatusFail(
                DioExceptions.fromDioError(e).responseError)));
      }
    });
  }
}
