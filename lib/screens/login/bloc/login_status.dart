import '../../../model/person.dart';
import '../../../network/custom_exception.dart';

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
  final Person person;

  LoginStatusSuccess(this.person,);

  // TODO: implement props
  List<Object?> get props => [person];
}