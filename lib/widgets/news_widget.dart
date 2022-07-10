import 'package:flutter/material.dart';
import 'package:socialworkapp/widgets/text_widget.dart';

import '../model/new.dart';
import '../untils/constants.dart';
import '../untils/untils.dart';

class NewsWidget extends StatelessWidget {
  final News news;
  const NewsWidget({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: ConstColors.black.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(Dimens.radiusButton),
        color: ConstColors.white,
        boxShadow: [
          BoxShadow(
            color: ConstColors.black.withOpacity(0.2),
            spreadRadius: 0.1,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: DimenUtilsPX.pxToPercentage(context, 175),
            height: DimenUtilsPX.pxToPercentage(context, 138),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 1, color: ConstColors.black.withOpacity(0.1)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(news.image ?? ''),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(Dimens.heightSmall),
            child: TextCustom(
              news.title ?? '',
              hadMaxLines: true,
              maxLines: 2,
              fontSize: Dimens.fontTab,
            ),
          )
        ],
      ),
    );
  }
}
