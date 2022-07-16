part of 'change_password_bloc.dart';

class ChangePasswordEvent {
  const ChangePasswordEvent();
}

class ChangePasswordAccount extends ChangePasswordEvent {
  final String id;
  final String password;
  final String newPassword;

  const ChangePasswordAccount({required this.id, required this.password, required this.newPassword});
}