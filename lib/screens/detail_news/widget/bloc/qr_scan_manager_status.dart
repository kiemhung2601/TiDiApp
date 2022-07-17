import 'package:socialworkapp/model/person.dart';

import '../../../../network/custom_exception.dart';

//#region rollUp
abstract class CheckRollUpStatus {
  const CheckRollUpStatus();
}

class InitCheckRollUpStatus extends CheckRollUpStatus {
  const InitCheckRollUpStatus();
}

class CheckRollUpLoadingStatus extends CheckRollUpStatus {
  const CheckRollUpLoadingStatus();
}

class CheckRollUpStatusFail extends CheckRollUpStatus {
  final ResponseError responseError;

  CheckRollUpStatusFail(this.responseError);
}

class CheckRollUpStatusSuccess extends CheckRollUpStatus {
  final UserApp userScanned;

  const CheckRollUpStatusSuccess(this.userScanned);
}
//#endregion