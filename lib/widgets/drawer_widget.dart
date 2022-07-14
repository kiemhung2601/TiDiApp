import 'package:flutter/material.dart';
import 'package:socialworkapp/untils/constant_string.dart';
import 'package:socialworkapp/untils/constants.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/drawer_item.dart';
import '../model/person.dart';
import '../screens/login/bloc/login_bloc.dart';
import '../untils/untils.dart';

class DrawerWidget extends StatelessWidget {
  final Person person;
  final ValueChanged<DrawerItem> onSelectdItem;
  final VoidCallback? pressBack;
  const DrawerWidget({Key? key, required this.person, required this.onSelectdItem, this.pressBack})
      : super(key: key);

  Widget buildDrawerItems(BuildContext context) {
    final account = context.read<LoginBloc>().account;
    return Column(
      children: DrawerItems.lstDrawer
          .map((item) => Visibility(
                visible: account.admin == true ? item != DrawerItems.qrcode : true,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: DimenUtilsPX.pxToPercentage(context, 24),
                    vertical: DimenUtilsPX.pxToPercentage(context, 8),
                  ),
                  leading: SvgPicture.asset(
                    item.iconUrl,
                    width: DimenUtilsPX.pxToPercentage(context, 30),
                    height: DimenUtilsPX.pxToPercentage(context, 30),
                    color: ConstColors.white,
                  ),
                  title: TextCustom(
                    item.title,
                    color: ConstColors.white,
                    fontWeight: true,
                  ),
                  onTap: () => onSelectdItem(item),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildInfoStudent(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: pressBack,
            child: Icon(
              Icons.arrow_back_ios,
              color: ConstColors.white,
              size: DimenUtilsPX.pxToPercentage(context, 30),
            )),
        const SizedBox(
          width: Dimens.marginView,
        ),
        Container(
          width: DimenUtilsPX.pxToPercentage(context, 45),
          height: DimenUtilsPX.pxToPercentage(context, 45),
          decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: ConstColors.black.withOpacity(0.1)),
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(person.urlImage ?? ''),
            ),
          ),
        ),
        const SizedBox(
          width: Dimens.heightSmall,
        ),
        TextCustom(
          person.name ?? '',
          color: ConstColors.white,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildInfoStudent(context),
            buildDrawerItems(context),
          ],
        ),
      ),
    );
  }
}

class DrawerItems {
  static const home = DrawerItem(title: ConstString.titleAppHome, iconUrl: Images.homeTab);
  static const history =
      DrawerItem(title: ConstString.titleAppHistory, iconUrl: Images.historyTab);
  static const notification =
      DrawerItem(title: ConstString.titleAppNotification, iconUrl: Images.notificationTab);
  static const information =
      DrawerItem(title: ConstString.information, iconUrl: Images.informationTab);
  static const news = DrawerItem(title: ConstString.news, iconUrl: Images.newsDrawer);
  static const qrcode = DrawerItem(title: ConstString.titleQr, iconUrl: Images.qrCode);
  static const settings = DrawerItem(title: ConstString.settings, iconUrl: Images.settings);
  static const logOut = DrawerItem(title: ConstString.signOut, iconUrl: Images.back);

  static final List<DrawerItem> lstDrawer = [
    home,
    history,
    notification,
    information,
    news,
    qrcode,
    settings,
    logOut
  ];
}
