import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'login_status.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  bool? admin;
  LoginBloc() : super(const LoginState()) {
    on<LoginAccountEvent>((event, emit) {
      emit(state.updateWith(loginStatus: const InitLoginStatus()));
      if(event.user == '141801773' && event.passWord == '12345'){
        admin = false;
        emit(state.updateWith(loginStatus: LoginStatusSuccess(admin!)));
      } else if(event.user == 'manager' && event.passWord == '12345'){
        admin = true;
        emit(state.updateWith(loginStatus: LoginStatusSuccess(admin!)));
      } else {
        emit(state.updateWith(loginStatus: LoginStatusFail(exception: 'Sai tài khoảng hoặc mật khẩu')));
      }
    });
  }
}
