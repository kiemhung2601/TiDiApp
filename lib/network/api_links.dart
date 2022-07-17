class ApiLinks {
  //api host
  static String apiHost = 'https://quan-ly-cong-tac-xa-hoi.vercel.app';

  //account
  static String logIn = '$apiHost/auth/login';
  static String updateInformationAccount = '$apiHost/account/update-account';
  static String changePassword = '$apiHost/account/change-password';
  static String logOut = '$apiHost/auth/logout';
  static String getInfo = '$apiHost/account/info-account';


  //contact
  static String getInfoContact = '$apiHost/contact/info';

  //news
  static String registerNews = '$apiHost/event-history/join-event';
  static String unRegisterNews = '$apiHost/event-history/delete-event';
  static String checkEnRollNews = '$apiHost/event-history/check-enroll-event';
  static String enRollNews = '$apiHost/event-history/enroll-event';
  static String getFourNews = '$apiHost/event/top-four';
  static String getListNews = '$apiHost/event/listAll';
  static String getDetailNews = '$apiHost/event/detail';

  //history
  static String loadHistory = '$apiHost/event-history/list';

  //information
  static String getListNotification = '$apiHost/auth/notifycation';
}