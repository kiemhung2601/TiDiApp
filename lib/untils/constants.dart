import 'package:flutter/material.dart';

class ConstColors {
  static const backGroundColor = Color(0xFFEDECEC);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const blue = Color(0xFF014a95);
  static const blueLight = Color(0xFF0fcfff);
  static const blueLight2 = Color(0xFFBBDEFB);
  static const blueLight3 = Color(0xFF4475F3);
  static const red = Color(0xFFE51313);
  static const redButton = Color(0xFF951819);
  static const redButton2 = Color(0xFFC37D7E);
  static const green = Color(0xFF02B14F);
}

class Dimens {
  //Font Size
  static const title = 13.0;
  static const body = 15.0;
  static const titlebBig = 17.0;
  static const titleSmall = 10.0;
  static const titleButton = 20.0;
  static const titleAppbar = 18.0;
  static const textFormField = 30.0;
  static const titleBigest = 35.0;
  static const fontTab = 13.0;

  //EdgeInsets
  static const marginView = 10.0;
  static const paddingView = 10.0;
  static const radius = 10.0;
  static const borderWidth = 10.0;
  static const radiusButton = 15.0;
  static const radiusTextFormField = 30.0;
  static const sizedBox = 20.0;
  static const heightSmall = 5.0;
  static const spaceBigest = 30.0;
}

class Images {
  static const defaultImg = 'res/assets/image_default.svg';
  static const logoIconApp = 'res/logo/logo-app.png';
  static const logoAppNonBG = 'res/logo/logo-app-nonBG.png';
  static const back = 'res/assets/ic_back.svg';
  static const logo = 'res/assets/logo.svg';
  static const notificationTab = 'res/assets/ic_notification_tab.svg';
  static const homeTab = 'res/assets/ic_home_tab.svg';
  static const historyTab = 'res/assets/ic_history_tab.svg';
  static const informationTab = 'res/assets/ic_information_tab.svg';
  static const newsDrawer = 'res/assets/ic_hotnew.svg';
  static const lottie = 'res/assets/bouncing-balls.json';

  //remove
  static const banner = 'res/assets/banner.png';
  static const news = 'res/assets/news.png';

  //login
  static const user = 'res/assets/login/ic_user.svg';
  static const passWord = 'res/assets/login/ic_password.svg';

  // information
  static const contact = 'res/assets/information/ic_contact.svg';
  static const dateBirthDay = 'res/assets/information/ic_date_birthday.svg';
  static const gender = 'res/assets/information/ic_gender.svg';
  static const mail = 'res/assets/information/ic_mail.svg';
  static const person = 'res/assets/information/ic_person.svg';
  static const phone = 'res/assets/information/ic_phone.svg';
  static const settings = 'res/assets/information/ic_settings.svg';
  static const studentCard = 'res/assets/information/ic_student_card.svg';
  static const location = 'res/assets/information/ic_location.svg';
  static const next = 'res/assets/information/ic_next.svg';

  //home
  static const scoreSocialWork = 'res/assets/home/ic_score_socialwork.svg';
  static const newsNav = 'res/assets/home/ic_newsblack_nav.svg';
  static const qrCodeNav = 'res/assets/home/ic_qrcode_nav.svg';
  static const qrScanNav = 'res/assets/home/ic_qrscan_nav.svg';

  //history
  static const search = 'res/assets/history/ic_search.svg';
  static const filter = 'res/assets/history/ic_filter.svg';
  static const complete = 'res/assets/history/ic_complete.svg';
  static const fail = 'res/assets/history/ic_fail.svg';
  static const register = 'res/assets/history/ic_register.svg';

  //notification
  static const bluePoint = 'res/assets/notification/ic_blue_point.svg';
  static const redPoint = 'res/assets/notification/ic_red_point.svg';
  static const timeNotification = 'res/assets/notification/ic_notification.svg';

  //qr
  static const qrCode = 'res/assets/qr/ic_qrcode.svg';
  static const qrScan = 'res/assets/qr/ic_qrscan.svg';
  static const flash = 'res/assets/qr/ic_flash.svg';
  static const changeCamera = 'res/assets/qr/ic_change_camera.svg';

  //news
  static const stack = 'res/assets/news/ic_stack.svg';

  //contact
  static const mailCT = 'res/assets/contact/ic_email_ct.svg';
  static const locationCT = 'res/assets/contact/ic_location_ct.svg';
  static const phoneCT = 'res/assets/contact/ic_phone_ct.svg';
  static const school = 'res/assets/contact/ic_school.svg';
  static const website = 'res/assets/contact/ic_website.svg';
  static const workingTimeCT = 'res/assets/contact/ic_workingtime_ct.svg';
}

class HeadPhone {
  //viettel
  static const viettel1 = '032';
  static const viettel2 = '033';
  static const viettel3 = '034';
  static const viettel4 = '035';
  static const viettel5 = '036';
  static const viettel6 = '037';
  static const viettel7 = '038';
  static const viettel8 = '039';

  //mobi
  static const mobi1 = '070';
  static const mobi2 = '079';
  static const mobi3 = '077';
  static const mobi4 = '076';
  static const mobi5 = '078';

  //vina
  static const vina1 = '083';
  static const vina2 = '084';
  static const vina3 = '085';
  static const vina4 = '081';
  static const vina5 = '082';

  //vietnam
  static const vn1 = '056';
  static const vn2 = '058';

  //gmobile
  static const gmobile1 = '059';

  static List<String> headPhone() {
    List<String> lstHeadPhone = [
      viettel1,
      viettel2,
      viettel3,
      viettel4,
      viettel5,
      viettel6,
      viettel7,
      viettel8,
      mobi1,
      mobi2,
      mobi3,
      mobi4,
      mobi5,
      vina1,
      vina2,
      vina3,
      vina4,
      vina5,
      vn1,
      vn2,
      gmobile1
    ];
    return lstHeadPhone;
  }
}
