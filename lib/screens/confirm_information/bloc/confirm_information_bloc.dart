import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/screens/confirm_information/bloc/confirm_information_status.dart';
import 'package:dio/dio.dart';

import '../../../network/custom_exception.dart';
import '../../../repository/repos.dart';

part 'confirm_information_event.dart';
part 'confirm_information_state.dart';

class ConfirmInformationBloc
    extends Bloc<ConfirmInformationEvent, ConfirmInformationState> {
  ConfirmInformationBloc() : super(const ConfirmInformationState()) {
    on<RollUpEvent>((event, emit) async {
      try {
        emit(state.updateWith(rollUpStatus: const RollUpLoadingStatus()));
        final result = await ApiRepository.newsRepo
            .enRollNews(event.idEvent, event.idTeacher, event.idUser);

        if (result.data['status'] == 1) {
          emit(state.updateWith(rollUpStatus: const RollUpStatusSuccess()));
        } else {
          emit(state.updateWith(
              rollUpStatus: RollUpStatusFail(ResponseError(
                  errorCode: result.data['status'].toString(),
                  message: result.data['msg']))));
        }
      } on DioError catch (e) {
        emit(state.updateWith(
            rollUpStatus:
                RollUpStatusFail(DioExceptions.fromDioError(e).responseError)));
      }
    });
  }
}
