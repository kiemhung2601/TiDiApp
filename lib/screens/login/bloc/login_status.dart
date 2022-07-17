import '../../../model/person.dart';
import '../../../network/custom_exception.dart';

//#region Login
abstract class LoginStatus {
  const LoginStatus();
}

class InitLoginStatus extends LoginStatus {
  const InitLoginStatus();
}

class LoginLoadingStatus extends LoginStatus {
  const LoginLoadingStatus();
}

class LoginStatusFail extends LoginStatus {
  final ResponseError responseError;

  LoginStatusFail(this.responseError);
}

class LoginStatusSuccess extends LoginStatus {
  final UserApp person;

  LoginStatusSuccess(this.person,);

  // TODO: implement props
  List<Object?> get props => [person];
}
//#endregion

//#region Logout
abstract class LogoutStatus {
  const LogoutStatus();
}

class InitLogoutStatus extends LogoutStatus {
  const InitLogoutStatus();
}

class LogoutLoadingStatus extends LogoutStatus {
  const LogoutLoadingStatus();
}

class LogoutStatusFail extends LogoutStatus {
  final ResponseError responseError;

  LogoutStatusFail(this.responseError);
}

class LogoutStatusSuccess extends LogoutStatus {
  const LogoutStatusSuccess();
}
//#endregion
