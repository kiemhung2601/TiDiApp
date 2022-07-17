import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/model/person.dart';
import 'package:socialworkapp/repository/repos.dart';
import 'package:socialworkapp/screens/detail_news/widget/bloc/qr_scan_manager_status.dart';
import 'package:dio/dio.dart';

import '../../../../network/custom_exception.dart';

part 'qr_scan_manager_event.dart';
part 'qr_scan_manager_state.dart';

class QrScanManagerBloc extends Bloc<QrScanManagerEvent, QrScanManagerState> {
  QrScanManagerBloc() : super(const QrScanManagerState()) {
    on<CheckRollUpEvent>((event, emit) async {
      try {
        emit(state.updateWith(checkRollUpStatus: const CheckRollUpLoadingStatus()));
        final result = await ApiRepository.newsRepo.checkEnRollNews(event.idEvent, event.idTeacher, event.idUser);

        if (result.data['status'] == 1) {
          final userScanned = UserApp.fromJson(result.data['data']);
          emit(state.updateWith(
              checkRollUpStatus: CheckRollUpStatusSuccess(userScanned)));
        } else {
          emit(state.updateWith(
              checkRollUpStatus: CheckRollUpStatusFail(
                  ResponseError(
                      errorCode: result.data['status'].toString(),
                      message: result.data['msg']))));
        }

      } on DioError catch (e) {
        emit(state.updateWith(
            checkRollUpStatus: CheckRollUpStatusFail(
                DioExceptions.fromDioError(e).responseError)));
      }
    });
  }
}
