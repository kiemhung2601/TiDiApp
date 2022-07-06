import 'package:flutter/material.dart';
import 'package:socialworkapp/widgets/confirm_dialog_widget.dart';

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
