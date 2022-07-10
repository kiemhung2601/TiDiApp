import '../../../model/person.dart';

abstract class HomeMainStatus {
  const HomeMainStatus();
}

class InitHomeMainStatus extends HomeMainStatus {
  const InitHomeMainStatus();
}

// class AddFavProductStatusFail extends InformationStatus {
//   final ResponseError? responseError;
//
//   AddFavProductStatusFail({this.responseError});
//
//   List<Object?> get props => [responseError];
// }

class HomeMainStatusSuccess extends HomeMainStatus {
  final Person person;

  HomeMainStatusSuccess(this.person,);

  // TODO: implement props
  List<Object?> get props => [person];
}