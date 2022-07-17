import '../network/api_services.dart';

abstract class NewsRepo {
  Future registerNews(String idEvent, String idStudent);
}

class NewsRepoImpl extends NewsRepo {
  final ApiServices _apiServices;

  NewsRepoImpl(this._apiServices);

  @override
  Future registerNews(String idEvent, String idStudent) {
    return _apiServices.registerNews(idEvent, idStudent);
  }

}