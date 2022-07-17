class ApiLinks {
  //api host
  static String apiHost = 'https://quan-ly-cong-tac-xa-hoi.vercel.app';

  //account
  static String logIn = '$apiHost/auth/login';
  static String updateInformationAccount = '$apiHost/account/update-account';
  static String changePassword = '$apiHost/account/change-password';
  static String logOut = '$apiHost/auth/logout';

  //contact
  static String getInfoContact = '$apiHost/contact/info';

  //news
  static String registerNews = '$apiHost/event-history/join-event';
}