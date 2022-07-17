

import '../network/api_services.dart';

abstract class HistoryRepo {
  Future getListHistory(String idStudent);
}

class HistoryRepoImpl extends HistoryRepo {
  final ApiServices _apiServices;

  HistoryRepoImpl(this._apiServices);

  @override
  Future getListHistory(String idStudent) {
    return _apiServices.getListHistory(idStudent);
  }
}