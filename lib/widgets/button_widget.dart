import 'package:flutter/material.dart';
import 'package:socialworkapp/widgets/text_widget.dart';

import '../untils/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final double? fontSize;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.style,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Dimens.paddingView),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.radiusButton),
            gradient: const LinearGradient(
              colors: [ConstColors.blue, ConstColors.blueLight],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Center(
          child: TextCustom(
            text,
            fontWeight: true,
            fontSize: fontSize ?? Dimens.titleButton,
            color: ConstColors.white,
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final double? fontSize;

  const SecondaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.style,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Dimens.paddingView),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.radiusButton),
            gradient: const LinearGradient(
              colors: [ConstColors.redButton2, ConstColors.redButton],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Center(
          child: TextCustom(
            text,
            fontWeight: true,
            fontSize: fontSize ?? Dimens.titleButton,
            color: ConstColors.white,
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
