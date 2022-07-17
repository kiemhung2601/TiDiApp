
import 'package:socialworkapp/model/person.dart';

import '../../../network/custom_exception.dart';

//#region qr scan
abstract class QrScanStatus {
  const QrScanStatus();
}

class InitQrScanStatus extends QrScanStatus {
  const InitQrScanStatus();
}

class QrScanLoadingStatus extends QrScanStatus {
  const QrScanLoadingStatus();
}

class QrScanStatusFail extends QrScanStatus {
  final ResponseError responseError;

  QrScanStatusFail(this.responseError);
}

class QrScanStatusSuccess extends QrScanStatus {
  final UserApp userScanned;
  const QrScanStatusSuccess(this.userScanned);
}
//#endregion