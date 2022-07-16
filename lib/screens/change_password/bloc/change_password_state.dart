part of 'change_password_bloc.dart';

class ChangePasswordState extends Equatable {
  final ChangePasswordStatus changePasswordStatus;

  const ChangePasswordState({
    this.changePasswordStatus = const InitChangePasswordStatus(),
  });

  ChangePasswordState updateWith({
    ChangePasswordStatus? changePasswordStatus,
  }) {
    return ChangePasswordState(
      changePasswordStatus: changePasswordStatus ?? this.changePasswordStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    changePasswordStatus,
  ];
}
