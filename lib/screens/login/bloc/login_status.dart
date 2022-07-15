import '../../../model/person.dart';

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
  final String? exception;

  LoginStatusFail({this.exception});

  List<Object?> get props => [exception];
}

class LoginStatusSuccess extends LoginStatus {
  final Person person;

  LoginStatusSuccess(this.person,);

  // TODO: implement props
  List<Object?> get props => [person];
}