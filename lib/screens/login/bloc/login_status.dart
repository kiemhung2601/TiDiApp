import '../../../model/account.dart';

abstract class LoginStatus {
  const LoginStatus();
}

class InitLoginStatus extends LoginStatus {
  const InitLoginStatus();
}

class LoginStatusFail extends LoginStatus {
  final String? exception;

  LoginStatusFail({this.exception});

  List<Object?> get props => [exception];
}

class LoginStatusSuccess extends LoginStatus {
  final Account account;

  LoginStatusSuccess(this.account,);

  // TODO: implement props
  List<Object?> get props => [account];
}