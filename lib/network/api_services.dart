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

  Future checkEnRollNews(String idEvent, String idTeacher, String idStudent) async {
    var map = {'event_id': idEvent, 'teacher_id': idTeacher, 'user_id': idStudent};

    final response = await post(
      ApiLinks.checkEnRollNews,
      body: map,
    );
    return response;
  }

  Future enRollNews(String idEvent, String idTeacher, String idStudent) async {
    var map = {'event_id': idEvent, 'teacher_id': idTeacher, 'user_id': idStudent};

    final response = await post(
      ApiLinks.enRollNews,
      body: map,
    );
    return response;
  }

  Future unRegisterNews(String idEvent, String idStudent) async {
    var map = {'event_id': idEvent, 'user_id': idStudent};

    final response = await post(
      ApiLinks.unRegisterNews,
      body: map,
    );
    return response;
  }

  Future getListHistory(String idStudent) async {
    var map = {'user_id': idStudent};

    final response = await get(
      ApiLinks.loadHistory,
      map: map,
    );
    return response;
  }

  Future getFourNews() async {
    final response = await get(
      ApiLinks.getFourNews,
    );
    return response;
  }

  Future getListNews() async {
    final response = await get(
      ApiLinks.getListNews,
    );
    return response;
  }

  Future getDetailNews(String idEvent, String idUser) async {
    var map = {'event_id': idEvent, 'user_id': idUser};

    final response = await get(
      ApiLinks.getDetailNews,
      map: map
    );
    return response;
  }

  Future getInfoQR(String targetId, String userId) async {
    var map = {'target_id': targetId, 'user_id': userId};

    final response = await get(
        ApiLinks.getInfo,
        map: map
    );
    return response;
  }
}
