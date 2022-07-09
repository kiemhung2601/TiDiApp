import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socialworkapp/widgets/text_widget.dart';

import '../untils/constants.dart';
import '../untils/untils.dart';

class CustomNav extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback? onPressed;
  const CustomNav({Key? key, required this.icon, required this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.radiusButton),
          color: ConstColors.white,
        ),
        padding: const EdgeInsets.only(
          top: Dimens.heightSmall,
          bottom: Dimens.heightSmall,
          left: Dimens.marginView,
          right: Dimens.marginView,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    width: DimenUtilsPX.pxToPercentage(context, 32),
                    height: DimenUtilsPX.pxToPercentage(context, 32),
                  ),
                  const SizedBox(
                    width: Dimens.heightSmall,
                  ),
                  TextCustom(
                    title,
                    fontWeight: true,
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              Images.next,
              width: DimenUtilsPX.pxToPercentage(context, 32),
              height: DimenUtilsPX.pxToPercentage(context, 32),
            ),
          ],
        ),
      ),
    );
  }
}
