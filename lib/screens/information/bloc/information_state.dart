part of 'information_bloc.dart';

class InformationState extends Equatable {
  final InformationStatus informationStatus;

  const InformationState({
    this.informationStatus = const InitInformationStatus(),
  });

  InformationState updateWith({
    InformationStatus? informationStatus,
  }) {
    return InformationState(
      informationStatus: informationStatus ?? this.informationStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    informationStatus,
  ];
}