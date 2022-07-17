import '../network/api_services.dart';

abstract class NewsRepo {
  Future registerNews(String idEvent, String idStudent);
  Future checkEnRollNews(String idEvent, String idTeacher, String idStudent);
  Future enRollNews(String idEvent, String idTeacher, String idStudent);
  Future unRegisterNews(String idEvent, String idStudent);
  Future getFourNews();
  Future getListNews();
}

class NewsRepoImpl extends NewsRepo {
  final ApiServices _apiServices;

  NewsRepoImpl(this._apiServices);

  @override
  Future registerNews(String idEvent, String idStudent) {
    return _apiServices.registerNews(idEvent, idStudent);
  }

  @override
  Future checkEnRollNews(String idEvent, String idTeacher, String idStudent) {
    return _apiServices.checkEnRollNews(idEvent, idTeacher, idStudent);
  }

  @override
  Future enRollNews(String idEvent, String idTeacher, String idStudent) {
    return _apiServices.enRollNews(idEvent, idTeacher, idStudent);
  }

  @override
  Future unRegisterNews(String idEvent, String idStudent) {
    return _apiServices.unRegisterNews(idEvent, idStudent);
  }

  @override
  Future getFourNews() {
    return _apiServices.getFourNews();
  }

  @override
  Future getListNews() {
    return _apiServices.getListNews();
  }
}