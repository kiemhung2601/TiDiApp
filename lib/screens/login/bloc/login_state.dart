part of 'login_bloc.dart';

class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final LogoutStatus logoutStatus;

  const LoginState({
    this.loginStatus = const InitLoginStatus(),
    this.logoutStatus = const InitLogoutStatus(),
  });

  LoginState updateWith({
    LoginStatus? loginStatus,
    LogoutStatus? logoutStatus,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      logoutStatus: logoutStatus ?? this.logoutStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        loginStatus,
        logoutStatus,
      ];
}
