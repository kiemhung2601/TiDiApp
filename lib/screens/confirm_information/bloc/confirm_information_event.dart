part of 'confirm_information_bloc.dart';

class ConfirmInformationEvent {
  const ConfirmInformationEvent();
}

class RollUpEvent extends ConfirmInformationEvent {
  final String idEvent;
  final String idTeacher;
  final String idUser;

  const RollUpEvent({required this.idEvent, required this.idTeacher, required this.idUser});
}