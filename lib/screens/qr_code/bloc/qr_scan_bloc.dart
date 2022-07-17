import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/model/person.dart';
import 'package:socialworkapp/screens/qr_code/bloc/qr_scan_status.dart';
import 'package:dio/dio.dart';

import '../../../network/custom_exception.dart';
import '../../../repository/repos.dart';

part 'qr_scan_event.dart';
part 'qr_scan_state.dart';

class QrScanBloc extends Bloc<QrScanEvent, QrScanState> {
  QrScanBloc() : super(const QrScanState()) {
    on<LoadInfoQr>((event, emit) async {
      try {
        emit(state.updateWith(qrScanStatus: const QrScanLoadingStatus()));

        final result = await ApiRepository.accountRepo.getInfoQR(event.idTarger, event.idAccount);

        if (result.data['status'] == 1) {
          UserApp userScanned = UserApp.fromJson(result.data['data']);
          emit(state.updateWith(qrScanStatus: QrScanStatusSuccess(userScanned)));
        } else {
          emit(state.updateWith(
              qrScanStatus: QrScanStatusFail(ResponseError(
                  errorCode: result.data['status'].toString(),
                  message: result.data['msg']))));
        }
      } on DioError catch (e) {
        emit(state.updateWith(
            qrScanStatus:
                QrScanStatusFail(DioExceptions.fromDioError(e).responseError)));
      }
    });
  }
}
