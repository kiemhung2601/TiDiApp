part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class InitialEvent extends LoginEvent {}

class LoginAccountEvent extends LoginEvent {
  final String user;
  final String passWord;
  final String deviceToken;

  const LoginAccountEvent({required this.user, required this.passWord, required this.deviceToken});
}

class LogoutAccountEvent extends LoginEvent {
  final String id;

  const LogoutAccountEvent({required this.id});
}