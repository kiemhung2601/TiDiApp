import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/untils/constant_string.dart';

import '../../../model/person.dart';
import '../../../repository/repos.dart';
import 'login_status.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  Person? person;
  LoginBloc() : super(const LoginState()) {
    on<LoginAccountEvent>((event, emit) async {
      emit(state.updateWith(loginStatus: const LoginLoadingStatus()));
      final result = await ApiRepository.accountRepo.reqeustLogin(event.user, event.passWord);
      if(result.data['data'] != null){
        person = Person.fromJson(result.data['data']);
      }

      if(result.data['status'] == 1){
        if(person?.isLock == 0){
          emit(state.updateWith(loginStatus: LoginStatusSuccess(person!)));
        } else{
          emit(state.updateWith(loginStatus: LoginStatusFail(exception: ConstString.clock)));
        }
      } else{
        emit(state.updateWith(loginStatus: LoginStatusFail(exception: result.data['msg'])));
      }
    });
  }
}
