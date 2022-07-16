//#region UpdateInformation
import '../../../network/custom_exception.dart';

abstract class ChangePasswordStatus {
  const ChangePasswordStatus();
}

class InitChangePasswordStatus extends ChangePasswordStatus {
  const InitChangePasswordStatus();
}

class ChangePasswordLoadingStatus extends ChangePasswordStatus {
  const ChangePasswordLoadingStatus();
}

class ChangePasswordStatusFail extends ChangePasswordStatus {
  final ResponseError responseError;

  ChangePasswordStatusFail(this.responseError);
}

class ChangePasswordStatusSuccess extends ChangePasswordStatus {
  final String message;
  const ChangePasswordStatusSuccess( this.message);
}
//#endregion