
import '../../../model/new.dart';

abstract class DetailNewsStatus {
  const DetailNewsStatus();
}

class InitDetailNewsStatus extends DetailNewsStatus {
  const InitDetailNewsStatus();
}

// class AddFavProductStatusFail extends InformationStatus {
//   final ResponseError? responseError;
//
//   AddFavProductStatusFail({this.responseError});
//
//   List<Object?> get props => [responseError];
// }

class  DetailNewsStatusSuccess extends DetailNewsStatus {
  final News news;

  DetailNewsStatusSuccess(this.news,);

  // TODO: implement props
  List<Object?> get props => [news];
}