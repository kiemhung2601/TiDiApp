
import '../../../model/history.dart';

abstract class HistoryStatus {
  const HistoryStatus();
}

class InitHistoryStatus extends HistoryStatus {
  const InitHistoryStatus();
}

// class AddFavProductStatusFail extends InformationStatus {
//   final ResponseError? responseError;
//
//   AddFavProductStatusFail({this.responseError});
//
//   List<Object?> get props => [responseError];
// }

class HistoryStatusSuccess extends HistoryStatus {
  final List<History> lstHistory;

  HistoryStatusSuccess(this.lstHistory,);

  // TODO: implement props
  List<Object?> get props => [lstHistory];
}