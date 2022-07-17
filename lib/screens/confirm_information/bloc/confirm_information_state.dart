part of 'confirm_information_bloc.dart';

class ConfirmInformationState extends Equatable {
  final RollUpStatus rollUpStatus;

  const ConfirmInformationState({
    this.rollUpStatus = const InitRollUpStatus(),
  });

  ConfirmInformationState updateWith({
    RollUpStatus? rollUpStatus,
  }) {
    return ConfirmInformationState(
      rollUpStatus: rollUpStatus ?? this.rollUpStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    rollUpStatus,
  ];
}