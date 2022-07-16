class ApiLinks {
  //api host
  static String apiHost = 'http://192.168.1.94:8000';

  //account
  static String getAccessToken = '$apiHost/auth/login';
  static String updateInformationAccount = '$apiHost/account/update-account';
  static String changePassword = '$apiHost/account/change-password';
}