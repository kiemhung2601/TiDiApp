import 'package:flutter/material.dart';
import 'package:socialworkapp/widgets/confirm_dialog_widget.dart';

import 'constant_string.dart';
import 'date_time_format.dart';

class AppUtils {
  static Future<bool> showDialogCustom({
    required BuildContext context,
    String? title,
    String? strConfirm,
    String? strCancel,
    VoidCallback? onConfirmClick,
    VoidCallback? onCancelClick,
  }) async {
    return await showDialog(
          context: context,
          builder: (context) {
            return ConfirmDialogWidget(
                title: title,
                strConfirm: strConfirm,
                strCancel: strCancel,
                onConfirmClick: onConfirmClick,
                onCancelClick: onCancelClick);
          },
        ) ??
        false;
  }
}

class DimenUtilsPX {
  static double pxToPercentage(BuildContext context, double value) {
    double width = MediaQuery.of(context).size.width;
    double percentageWidth = width / 375; // default: 812 x 375, iPhone 11 Pro
    return percentageWidth * value;
  }
}

class StringUtils {
  static String formatTime(String? timeBig, String? dateSmall) {
    String text = '';
    int result = 0;
    result = DateTime.parse(timeBig ?? "")
        .difference(DateTime.parse(dateSmall ?? ""))
        .inSeconds;
    text = '$result ${ConstString.seconds}';
    if (result >= 60) {
      result = 0;
      result = DateTime.parse(timeBig ?? "")
          .difference(DateTime.parse(dateSmall ?? ""))
          .inMinutes;
      text = '$result ${ConstString.minutes}';
    }
    if (result >= 60) {
      result = 0;
      result = DateTime.parse(timeBig ?? "")
          .difference(DateTime.parse(dateSmall ?? ""))
          .inHours;
      text = '$result ${ConstString.hours}';
    }
    if (result >= 24) {
      result = 0;
      result = DateTime.parse(timeBig ?? "")
          .difference(DateTime.parse(dateSmall ?? ""))
          .inDays;
      text = '$result ${ConstString.day}';
    }
    return text;
  }

  static String formatDate(String? time) {
    return DateTimeFormatter.showDateFormat.format(DateTime.parse(time ?? ""));
  }
}
