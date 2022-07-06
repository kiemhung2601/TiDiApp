part of 'login_bloc.dart';

class LoginState extends Equatable {
  final LoginStatus loginStatus;

  const LoginState({
    this.loginStatus = const InitLoginStatus(),
  });

  LoginState updateWith({
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    loginStatus,
  ];
}