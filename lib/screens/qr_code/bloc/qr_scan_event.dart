part of 'qr_scan_bloc.dart';

class QrScanEvent {
  const QrScanEvent();
}

class LoadInfoQr extends QrScanEvent {
  final String idAccount;
  final String idTarger;

  const LoadInfoQr({required this.idAccount, required this.idTarger});
}
