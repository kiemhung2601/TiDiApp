import '../../../network/custom_exception.dart';

//#region register
abstract class RollUpStatus {
  const RollUpStatus();
}

class InitRollUpStatus extends RollUpStatus {
  const InitRollUpStatus();
}

class RollUpLoadingStatus extends RollUpStatus {
  const RollUpLoadingStatus();
}

class RollUpStatusFail extends RollUpStatus {
  final ResponseError responseError;
  RollUpStatusFail(this.responseError);
}

class RollUpStatusSuccess extends RollUpStatus {
  const RollUpStatusSuccess();
}
//#endregion