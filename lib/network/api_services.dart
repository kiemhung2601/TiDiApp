import 'package:socialworkapp/network/network.dart';

import 'api_links.dart';

class ApiServices {
  static String fieldKey = "key";
  static String keyHeaders = "projectquanlycongtacxahoi";

  Future requestLogin(String username, String password, String deviceToken) async {
    var map = {'username': username, 'password': password, 'device_token': deviceToken};
    final response = await post(
      ApiLinks.logIn,
      body: map,
    );
    return response;
  }

  Future updateInforAccount(String id, String address, String email, String phone) async {
    var map = {'_id': id, 'address': address, 'mail': email, 'phone': phone};
    final response = await post(
        ApiLinks.updateInformationAccount,
        body: map,
    );
    return response;
  }

  Future changePassword(String id, String password, String newPassword) async {
    var map = {'_id': id, 'password': password, 'newpassword': newPassword};
    final response = await post(
        ApiLinks.changePassword,
        body: map,
    );
    return response;
  }

  Future getInfoContact() async {
    final response = await post(
        ApiLinks.getInfoContact,
    );
    return response;
  }

  Future requestLogout(String id) async {
    var map = {'user_id': id};

    final response = await post(
        ApiLinks.logOut,
        body: map,
    );
    return response;
  }

  Future registerNews(String idEvent, String idStudent) async {
    var map = {'event_id': idEvent, 'user_id': idStudent};

    final response = await post(
        ApiLinks.registerNews,
        body: map,
    );
    return response;
  }
}
