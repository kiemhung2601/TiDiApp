import '../../../model/history.dart';
import '../../../network/custom_exception.dart';

abstract class HistoryStatus {
  const HistoryStatus();
}

class InitHistoryStatus extends HistoryStatus {
  const InitHistoryStatus();
}

class HistoryStatusFail extends HistoryStatus {
  final ResponseError responseError;

  HistoryStatusFail(this.responseError);
}

class HistoryStatusSuccess extends HistoryStatus {
  final List<History> lstHistory;

  HistoryStatusSuccess(this.lstHistory,);

  // TODO: implement props
  List<Object?> get props => [lstHistory];
}