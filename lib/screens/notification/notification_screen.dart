import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialworkapp/screens/detail_news/detail_news.dart';

import '../login/bloc/login_bloc.dart';
import '../../untils/constant_string.dart';
import '../../untils/constants.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import '../../widgets/text_widget.dart';

class NotificationScreen extends StatelessWidget {
  final VoidCallback openDrawer;
  final bool isDrawerOpen;
  const NotificationScreen(
      {Key? key, required this.openDrawer, required this.isDrawerOpen})
      : super(key: key);

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      isHomePage: true,
      actions: null,
      title: ConstString.titleAppNotification,
      openDrawer: openDrawer,
    );
  }

  Widget _viewLine() {
    return Container(
      width: double.infinity,
      height: 2,
      decoration: BoxDecoration(
        color: ConstColors.backGroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
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
      padding: const EdgeInsets.only(
        top: Dimens.heightSmall,
        bottom: Dimens.heightSmall,
        left: Dimens.marginView,
        right: Dimens.marginView,
      ),
      margin: const EdgeInsets.only(bottom: Dimens.sizedBox),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: TextCustom(
                  'Thông tin tuyển sinh Đai Học Công Nghệ Đồng Nai năm 2022',
                  hadMaxLines: true,
                  maxLines: 2,
                  fontWeight: true,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    Images.bluePoint,
                    width: DimenUtilsPX.pxToPercentage(context, 9),
                    height: DimenUtilsPX.pxToPercentage(context, 9),
                  ),
                  const SizedBox(
                    height: Dimens.marginView,
                  ),
                  const TextCustom(
                    '1 giờ trước',
                    fontSize: Dimens.titleSmall,
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Dimens.heightSmall, right: Dimens.heightSmall),
            child: _viewLine(),
          ),
          const SizedBox(
            height: Dimens.marginView,
          ),
          const TextCustom(
            'Tên trường đại học công nghệ đồng nai, tuyển sinh viên năm học 2022 gồm các ngành nghề khác nhau như công nghệ thông tin, thực phẩm môi trường, Ngôn ngữ anh',
            hadMaxLines: true,
            maxLines: 2,
            fontSize: Dimens.title,
          ),
          const SizedBox(
            height: Dimens.sizedBox,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextCustom(
                '${ConstString.dateNews}: 21/02/2022',
                fontSize: Dimens.titleSmall,
                color: ConstColors.black,
                fontWeight: true,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    Images.timeNotification,
                    width: DimenUtilsPX.pxToPercentage(context, 20),
                    height: DimenUtilsPX.pxToPercentage(context, 20),
                  ),
                  const SizedBox(
                    width: Dimens.heightSmall,
                  ),
                  const TextCustom(
                    '${ConstString.dayScore}: 5, ${ConstString.still} 23 giờ',
                    fontSize: Dimens.titleSmall,
                    color: ConstColors.black,
                    fontWeight: true,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final admin = context.read<LoginBloc>().admin;
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimens.heightSmall,
        right: Dimens.heightSmall,
        top: Dimens.marginView,
        bottom: Dimens.marginView,
      ),
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (_, index) {
            return InkWell(
              child: _buildContent(context),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailNewsScreen(admin: admin!)));
              },
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isDrawerOpen ? ConstColors.blueLight2 : ConstColors.backGroundColor,
      appBar: _buildAppbar(),
      body: _buildBody(context),
    );
  }
}
