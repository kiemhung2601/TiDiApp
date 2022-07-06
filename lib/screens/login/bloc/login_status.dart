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
  final bool admin;

  LoginStatusSuccess(this.admin,);

  // TODO: implement props
  List<Object?> get props => [admin];
}