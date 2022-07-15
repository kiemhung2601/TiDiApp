part of 'information_bloc.dart';

class InformationState extends Equatable {
  final InformationStatus informationStatus;
  final UpdateInformationStatus updateInformationStatus;

  const InformationState({
    this.informationStatus = const InitInformationStatus(),
    this.updateInformationStatus = const InitUpdateInformationStatus(),
  });

  InformationState updateWith({
    InformationStatus? informationStatus,
    UpdateInformationStatus? updateInformationStatus,
  }) {
    return InformationState(
      informationStatus: informationStatus ?? this.informationStatus,
      updateInformationStatus:
          updateInformationStatus ?? this.updateInformationStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        informationStatus,
        updateInformationStatus,
      ];
}
