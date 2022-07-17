import 'package:flutter/material.dart';
import 'package:socialworkapp/untils/constant_string.dart';
import 'package:socialworkapp/widgets/text_widget.dart';

import '../model/new.dart';
import '../untils/constants.dart';
import '../untils/untils.dart';

class NewsWidget extends StatelessWidget {
  final News news;
  final bool isNews;
  const NewsWidget({Key? key, required this.news, this.isNews = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime _dateNow = DateTime.now();
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
            height: DimenUtilsPX.pxToPercentage(context, 120),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 1, color: ConstColors.black.withOpacity(0.1)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://cdn.pixabay.com/photo/2016/11/22/19/27/arid-1850193_960_720.jpg'),
              ),
            ),
          ),
          const SizedBox(
            height: Dimens.heightSmall,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Dimens.heightSmall, right: Dimens.heightSmall),
            child: Visibility(
                visible: isNews == true,
                child: Row(
                  children: [
                    SizedBox(
                      width: DimenUtilsPX.pxToPercentage(context, 65),
                      child: TextCustom(
                        '${ConstString.still} ${StringUtils.formatTime(news.endDate, _dateNow.toString())}',
                        fontSize: Dimens.titleSmall,
                        color: ConstColors.black,
                        maxLines: 1,
                        hadMaxLines: true,
                        overFlowFade: true,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: DimenUtilsPX.pxToPercentage(context, 65),
                      child: TextCustom(
                        '${news.point} ${ConstString.dayScore.toLowerCase()}',
                        fontSize: Dimens.titleSmall,
                        color: ConstColors.black,
                        maxLines: 1,
                        hadMaxLines: true,
                        overFlowFade: true,
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimens.heightSmall),
            child: TextCustom(
              news.title ?? '',
              hadMaxLines: true,
              maxLines: 2,
              fontSize: Dimens.fontTab,
              fontWeight: true,
            ),
          )
        ],
      ),
    );
  }
}
