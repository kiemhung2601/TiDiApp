part of 'qr_scan_manager_bloc.dart';

class QrScanManagerState extends Equatable {
  final CheckRollUpStatus checkRollUpStatus;

  const QrScanManagerState({
    this.checkRollUpStatus = const InitCheckRollUpStatus(),
  });

  QrScanManagerState updateWith({
    CheckRollUpStatus? checkRollUpStatus,
  }) {
    return QrScanManagerState(
      checkRollUpStatus: checkRollUpStatus ?? this.checkRollUpStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    checkRollUpStatus,
  ];
}
