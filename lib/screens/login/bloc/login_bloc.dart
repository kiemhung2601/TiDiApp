import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:socialworkapp/untils/constant_string.dart';
import 'package:dio/dio.dart';

import '../../../model/person.dart';
import '../../../network/custom_exception.dart';
import '../../../repository/repos.dart';
import 'login_status.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  Person? person;
  LoginBloc() : super(const LoginState()) {
    on<LoginAccountEvent>((event, emit) async {
      try{
        emit(state.updateWith(loginStatus: const LoginLoadingStatus()));
        final result = await ApiRepository.accountRepo.requestLogin(event.user, event.passWord);
        debugPrint(result.data['status'].toString());
        if (result.data['data'] != null) {
          person = Person.fromJson(result.data['data']);
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
    on<InitialEvent>((event, emit) async {
      emit(state.updateWith(loginStatus: const InitLoginStatus()));
    });
  }
}
