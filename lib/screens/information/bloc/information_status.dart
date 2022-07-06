import '../../../model/student.dart';

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
  final Student student;

  InformationStatusSuccess(this.student,);

  // TODO: implement props
  List<Object?> get props => [student];
}