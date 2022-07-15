import '../../../model/person.dart';

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
  final Person person;

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
  final String? exception;

  UpdateInformationStatusFail({this.exception});
}

class UpdateInformationStatusSuccess extends UpdateInformationStatus {
  final Person person;
  final String message;
  const UpdateInformationStatusSuccess(this.person, this.message);
}
//#endregion