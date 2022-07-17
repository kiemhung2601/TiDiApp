part of 'qr_scan_bloc.dart';

class QrScanState extends Equatable {
  final QrScanStatus qrScanStatus;

  const QrScanState({
    this.qrScanStatus = const InitQrScanStatus(),
  });

  QrScanState updateWith({
    QrScanStatus? qrScanStatus,
  }) {
    return QrScanState(
        qrScanStatus: qrScanStatus ?? this.qrScanStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    qrScanStatus,
  ];
}