import '../../../model/new.dart';
import '../../../model/person.dart';

abstract class HomeStatus {
  const HomeStatus();
}

class InitHomeStatus extends HomeStatus {
  const InitHomeStatus();
}

// class AddFavProductStatusFail extends InformationStatus {
//   final ResponseError? responseError;
//
//   AddFavProductStatusFail({this.responseError});
//
//   List<Object?> get props => [responseError];
// }

class HomeStatusSuccess extends HomeStatus {
  final UserApp person;
  HomeStatusSuccess({required this.person});

  // TODO: implement props
  List<Object?> get props => [];
}

abstract class NewsHomeStatus {
  const NewsHomeStatus();
}

class InitNewsHomeStatus extends NewsHomeStatus {
  const InitNewsHomeStatus();
}

// class AddFavProductStatusFail extends InformationStatus {
//   final ResponseError? responseError;
//
//   AddFavProductStatusFail({this.responseError});
//
//   List<Object?> get props => [responseError];
// }

class NewsHomeStatusSuccess extends NewsHomeStatus {
  final List<News> lstNews;
  NewsHomeStatusSuccess({required this.lstNews});

  // TODO: implement props
  List<Object?> get props => [lstNews];
}