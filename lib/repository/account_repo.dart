
import '../network/api_services.dart';

abstract class AccountRepo {
  Future reqeustLogin(String username, String password);
  Future updateInforAccount(String id, String address, String email, String phone);
}

class AccountRepoImpl extends AccountRepo {
  final ApiServices _apiServices;

  AccountRepoImpl(this._apiServices);

  @override
  Future reqeustLogin(String username, String password) {
    return _apiServices.requestLogin(username, password);
  }

  @override
  Future updateInforAccount(String id, String address, String email, String phone) {
    return _apiServices.updateInforAccount(id, address, email, phone);
  }
}