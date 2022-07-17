import '../../../model/person.dart';
import '../../../network/custom_exception.dart';

//#region LoadInformation
abstract class InformationStatus {
  const InformationStatus();
}

class InitInformationStatus extends InformationStatus {
  const InitInformationStatus();
}

// class AddFavProductStatusFail extends InformationStatus {
//   final ResponseError? responseError;
//
//   AddFavProductStatusFail({this.responseError});
//
//   List<Object?> get props => [responseError];
// }

class InformationStatusSuccess extends InformationStatus {
  final UserApp person;

  InformationStatusSuccess(this.person,);

  // TODO: implement props
  List<Object?> get props => [person];
}
//#endregion

//#region UpdateInformation
abstract class UpdateInformationStatus {
  const UpdateInformationStatus();
}

class InitUpdateInformationStatus extends UpdateInformationStatus {
  const InitUpdateInformationStatus();
}

class UpdateInformationLoadingStatus extends UpdateInformationStatus {
  const UpdateInformationLoadingStatus();
}

class UpdateInformationStatusFail extends UpdateInformationStatus {
  final ResponseError responseError;

  UpdateInformationStatusFail(this.responseError);
}

class UpdateInformationStatusSuccess extends UpdateInformationStatus {
  final UserApp person;
  final String message;
  const UpdateInformationStatusSuccess(this.person, this.message);
}
//#endregion