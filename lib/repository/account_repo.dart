import '../network/api_services.dart';

abstract class AccountRepo {
  Future requestLogin(String username, String password, String deviceToken);
  Future updateInforAccount(String id, String address, String email, String phone);
  Future changePassword(String id, String password, String newPassword);
  Future requestLogout(String id);
}

class AccountRepoImpl extends AccountRepo {
  final ApiServices _apiServices;

  AccountRepoImpl(this._apiServices);

  @override
  Future requestLogin(String username, String password, String deviceToken) {
    return _apiServices.requestLogin(username, password, deviceToken);
  }

  @override
  Future updateInforAccount(String id, String address, String email, String phone) {
    return _apiServices.updateInforAccount(id, address, email, phone);
  }

  @override
  Future changePassword(String id, String password, String newPassword) {
    return _apiServices.changePassword(id, password, newPassword);
  }
  
  @override
  Future requestLogout(String id) {
    return _apiServices.requestLogout(id);
  }
}