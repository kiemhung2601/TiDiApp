
import 'package:socialworkapp/model/new.dart';

abstract class NewsStatus {
  const NewsStatus();
}

class InitNewsStatus extends NewsStatus {
  const InitNewsStatus();
}

// class AddFavProductStatusFail extends InformationStatus {
//   final ResponseError? responseError;
//
//   AddFavProductStatusFail({this.responseError});
//
//   List<Object?> get props => [responseError];
// }

class NewsStatusSuccess extends NewsStatus {
  final List<News> lstNews;

  NewsStatusSuccess(this.lstNews,);

  // TODO: implement props
  List<Object?> get props => [lstNews];
}