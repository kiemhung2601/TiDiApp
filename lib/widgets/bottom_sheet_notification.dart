import 'package:flutter/material.dart';
import 'package:socialworkapp/untils/untils.dart';

import '../untils/constants.dart';

class BottomSheetNotificationDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key, List<Widget>? children}) =>
      showModalBottomSheet(
          context: context,
          useRootNavigator: false,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => BottomSheetNotificationDialog(
                key: key,
                children: children,
              )).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  final List<Widget>? children;

  const BottomSheetNotificationDialog({Key? key, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(Dimens.radiusButton),
            topRight: Radius.circular(Dimens.radiusButton),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          size: DimenUtilsPX.pxToPercentage(context, 24),
                        ),
                        padding: EdgeInsets.zero,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  Image.asset(
                    Images.logoAppNonBG,
                    height: DimenUtilsPX.pxToPercentage(context, 100),
                    width: DimenUtilsPX.pxToPercentage(context, 100),
                  ),
                  for (Widget item in children!) item,
                ]),
          ),
        ),
      ),
    );
  }
}
