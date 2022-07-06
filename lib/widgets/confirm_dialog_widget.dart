import 'package:flutter/material.dart';
import 'package:socialworkapp/widgets/button_widget.dart';
import 'package:socialworkapp/widgets/text_widget.dart';

import '../untils/constants.dart';
import '../untils/untils.dart';

class ConfirmDialogWidget extends StatelessWidget {
  final String? title;
  final String? strConfirm;
  final String? strCancel;
  final VoidCallback? onConfirmClick;
  final VoidCallback? onCancelClick;
  const ConfirmDialogWidget(
      {Key? key,
      this.title,
      this.strConfirm,
      this.strCancel,
      this.onConfirmClick,
      this.onCancelClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.radius)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
        height: DimenUtilsPX.pxToPercentage(context, 260),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [ConstColors.blueLight, ConstColors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(Dimens.radius))),
        child: Column(
          children: <Widget>[
            TextCustom(
              title!,
              fontSize: Dimens.titleAppbar,
              color: ConstColors.white,
              hadMaxLines: true,
              fontWeight: true,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: DimenUtilsPX.pxToPercentage(context, 30),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: DimenUtilsPX.pxToPercentage(context, 100),
                  child: SecondaryButton(
                    text: strCancel!,
                    fontSize: Dimens.body,
                    onPressed: () {
                          if (onCancelClick != null) {
                            onCancelClick!();
                          }
                    },
                  ),
                ),
                const SizedBox(
                  width: Dimens.spaceBigest,
                ),
                SizedBox(
                  width: DimenUtilsPX.pxToPercentage(context, 100),
                  child: PrimaryButton(
                    text: strConfirm!,
                    fontSize: Dimens.body,
                    onPressed: () {
                      if (onConfirmClick != null) {
                        onConfirmClick!();
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
