part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class InitialEvent extends LoginEvent {}

class LoginAccountEvent extends LoginEvent {
  final String user;
  final String passWord;

  const LoginAccountEvent({required this.user, required this.passWord});
}