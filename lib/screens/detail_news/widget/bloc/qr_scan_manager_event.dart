part of 'qr_scan_manager_bloc.dart';

class QrScanManagerEvent {
  const QrScanManagerEvent();
}

class CheckRollUpEvent extends QrScanManagerEvent {
  final String idEvent;
  final String idTeacher;
  final String idUser;

  const CheckRollUpEvent({required this.idEvent, required this.idTeacher, required this.idUser});
}
