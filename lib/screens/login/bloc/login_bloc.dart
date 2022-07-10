import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialworkapp/model/account.dart';

import 'login_status.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late Account account;
  LoginBloc() : super(const LoginState()) {
    on<LoginAccountEvent>((event, emit) {
      emit(state.updateWith(loginStatus: const InitLoginStatus()));
      if(event.user == '141801773' && event.passWord == '12345'){
        account = Account(accountId: 0, admin: false,);
        // admin = false;
        emit(state.updateWith(loginStatus: LoginStatusSuccess(account)));
      } else if(event.user == 'manager' && event.passWord == '12345'){
        // admin = true;
        account = Account(accountId: 1, admin: true,);
        emit(state.updateWith(loginStatus: LoginStatusSuccess(account)));
      } else {
        emit(state.updateWith(loginStatus: LoginStatusFail(exception: 'Sai tài khoảng hoặc mật khẩu')));
      }
    });
  }
}
