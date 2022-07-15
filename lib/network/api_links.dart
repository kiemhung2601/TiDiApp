class ApiLinks {
  //api host
  static String apiHost = 'http://192.168.1.94:8000';

  //account
  static String getAccessToken = '$apiHost/auth/login';

  //Information
  static String updateInformationAccount = '$apiHost/account/update-account';
}