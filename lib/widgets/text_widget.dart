import 'package:flutter/material.dart';
import 'package:socialworkapp/untils/constants.dart';

class TextCustom extends StatelessWidget {
  final String? data;
  final double fontSize;
  final Color color;
  final TextDecoration? decoration;
  final TextAlign textAlign;
  final bool? fontWeight;
  final bool hadMaxLines;
  final int? maxLines;
  final bool? styleItalic;
  final bool? overFlowFade;

  const TextCustom(
      this.data, {
        Key? key,
        this.fontSize = Dimens.body,
        this.color = Colors.black,
        this.decoration,
        this.textAlign = TextAlign.start,
        this.fontWeight = false,
        this.hadMaxLines = false,
        this.maxLines = 2,
        this.styleItalic = false,
        this.overFlowFade = false,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? '',
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: 'Roboto',
        fontWeight: fontWeight == true
            ? FontWeight.bold
            : FontWeight.normal,
        color: color,
        decoration: decoration,
        fontStyle: (styleItalic == true)
            ? FontStyle.italic
            : null,
      ),
      maxLines: maxLines,
      overflow: overFlowFade == false
          ? (hadMaxLines)
          ? TextOverflow.ellipsis
          : null
          :TextOverflow.fade,
      softWrap: overFlowFade == true ? false : null,
    );
  }
}