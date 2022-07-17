import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/untils/constant_string.dart';
import 'package:dio/dio.dart';

import '../../../model/person.dart';
import '../../../network/custom_exception.dart';
import '../../../repository/repos.dart';
import 'login_status.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserApp? person;
  LoginBloc() : super(const LoginState()) {
    on<LoginAccountEvent>((event, emit) async {
      try{
        if(state.logoutStatus is LogoutStatusSuccess)
          {
            emit(state.updateWith(logoutStatus: const InitLogoutStatus()));
          }
        emit(state.updateWith(loginStatus: const LoginLoadingStatus()));
        final result = await ApiRepository.accountRepo.requestLogin(event.user, event.passWord, event.deviceToken);
        if (result.data['data'] != null) {
          person = UserApp.fromJson(result.data['data']);
        }

        if (result.data['status'] == 1) {
          if (person?.isLock == 0) {
            emit(state.updateWith(loginStatus: LoginStatusSuccess(person!)));
          } else {
            emit(state.updateWith(
                loginStatus: LoginStatusFail(ResponseError(errorCode: result.data['status'].toString(), message: ConstString.block))));
          }
        } else {
          emit(state.updateWith(
              loginStatus: LoginStatusFail(ResponseError(errorCode: result.data['status'].toString(), message: result.data['msg']))));
        }
      } on DioError catch(e){
        emit(state.updateWith(
            loginStatus: LoginStatusFail(
                DioExceptions.fromDioError(e).responseError)));
      }
    });
    on<LogoutAccountEvent>((event, emit) async {
      try{
        if(state.loginStatus is LoginStatusSuccess){
          emit(state.updateWith(loginStatus: const InitLoginStatus()));
        }
        emit(state.updateWith(logoutStatus: const LogoutLoadingStatus()));
        final result = await ApiRepository.accountRepo.requestLogout(person!.id!);

        if (result.data['status'] == 1){
          emit(state.updateWith(logoutStatus: const LogoutStatusSuccess()));
        } else{
          emit(state.updateWith(logoutStatus: LogoutStatusFail(ResponseError(errorCode: result.data['status'].toString(), message: result.data['msg']))));
        }
      } on DioError catch(e){
        emit(state.updateWith(
            logoutStatus: LogoutStatusFail(
                DioExceptions.fromDioError(e).responseError)));
      }

    });
    on<InitialEvent>((event, emit) async {
      emit(state.updateWith(logoutStatus: const InitLogoutStatus()));
      emit(state.updateWith(loginStatus: const InitLoginStatus()));
    });
  }
}
