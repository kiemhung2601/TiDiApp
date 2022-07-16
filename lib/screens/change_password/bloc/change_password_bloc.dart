import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/repository/repos.dart';
import 'package:socialworkapp/screens/change_password/bloc/change_password_status.dart';
import 'package:dio/dio.dart';

import '../../../network/custom_exception.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(const ChangePasswordState()) {
    on<ChangePasswordAccount>((event, emit) async {
      try {
        emit(state.updateWith(
            changePasswordStatus: const ChangePasswordLoadingStatus()));
        final result = await ApiRepository.accountRepo
            .changePassword(event.id, event.password, event.newPassword);

        if (result.data['status'] == 1) {
          emit(state.updateWith(
              changePasswordStatus:
                  ChangePasswordStatusSuccess(result.data['msg'])));
        } else {
          emit(state.updateWith(
              changePasswordStatus: ChangePasswordStatusFail(ResponseError(
                  errorCode: result.data['status'].toString(), message: result.data['msg']))));
        }
      } on DioError catch (e) {
        emit(state.updateWith(
            changePasswordStatus: ChangePasswordStatusFail(
                DioExceptions.fromDioError(e).responseError)));
      }
    });
  }
}
