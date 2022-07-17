import '../network/api_services.dart';

abstract class ContactRepo {
  Future getInfoContact();
}

class ContactRepoImpl extends ContactRepo {
  final ApiServices _apiServices;

  ContactRepoImpl(this._apiServices);

  @override
  Future getInfoContact() {
    return _apiServices.getInfoContact();
  }

}