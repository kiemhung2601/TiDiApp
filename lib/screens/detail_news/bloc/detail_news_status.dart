import '../../../model/new.dart';
import '../../../network/custom_exception.dart';

//#region showDetailNews
abstract class DetailNewsStatus {
  const DetailNewsStatus();
}

class InitDetailNewsStatus extends DetailNewsStatus {
  const InitDetailNewsStatus();
}

class DetailNewsStatusFail extends DetailNewsStatus {
  final ResponseError responseError;

  DetailNewsStatusFail(this.responseError);
}

class  DetailNewsStatusSuccess extends DetailNewsStatus {
  final News news;

  DetailNewsStatusSuccess(this.news,);

  // TODO: implement props
  List<Object?> get props => [news];
}
//#endregion

//#region register
abstract class ChangeStatusNewsStatus {
  const ChangeStatusNewsStatus();
}

class InitChangeStatusNewsStatus extends ChangeStatusNewsStatus {
  const InitChangeStatusNewsStatus();
}

class ChangeStatusNewsLoadingStatus extends ChangeStatusNewsStatus {
  const ChangeStatusNewsLoadingStatus();
}

class ChangeStatusNewsStatusFail extends ChangeStatusNewsStatus {
  final ResponseError responseError;

  ChangeStatusNewsStatusFail(this.responseError);
}

class ChangeStatusNewsStatusSuccess extends ChangeStatusNewsStatus {
  const ChangeStatusNewsStatusSuccess();
}
//#endregion