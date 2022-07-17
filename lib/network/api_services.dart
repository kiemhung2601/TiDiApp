import 'package:dio/dio.dart';

import 'api_links.dart';

class ApiServices {
  static String fieldKey = "key";
  static String keyHeaders = "projectquanlycongtacxahoi";
  static Options options = Options(headers: {fieldKey: keyHeaders},);

  Future requestLogin(String username, String password) async {
    var map = {'username': username, 'password': password};

    final response = await Dio().post(
      ApiLinks.getAccessToken,
      data: map,
      options: options
    );
    return response;
  }

  Future updateInforAccount(String id, String address, String email, String phone) async {
    var map = {'_id': id, 'address': address, 'mail': email, 'phone': phone};
    final response = await Dio().post(
        ApiLinks.updateInformationAccount,
        data: map,
        options: options
    );
    return response;
  }

  Future changePassword(String id, String password, String newPassword) async {
    var map = {'_id': id, 'password': password, 'newpassword': newPassword};
    final response = await Dio().post(
        ApiLinks.changePassword,
        data: map,
        options: options
    );
    return response;
  }

  Future getInfoContact() async {
    final response = await Dio().post(
        ApiLinks.getInfoContact,
        options: options
    );
    return response;
  }
}
