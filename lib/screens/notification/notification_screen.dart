import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socialworkapp/screens/detail_news/detail_news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialworkapp/screens/notification/bloc/notification_status.dart';

import '../../model/account.dart';
import '../../model/notification.dart';
import '../../untils/constant_string.dart';
import '../../untils/constants.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import '../../widgets/text_widget.dart';
import '../login/bloc/login_bloc.dart';
import 'bloc/notification_bloc.dart';

class NotificationScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  final bool isDrawerOpen;
  const NotificationScreen(
      {Key? key, required this.openDrawer, required this.isDrawerOpen})
      : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Account _account;
  final DateTime _dateNow = DateTime.now();

  @override
  void initState() {
    _account = context.read<LoginBloc>().account;

    super.initState();
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      isHomePage: true,
      actions: null,
      title: ConstString.titleAppNotification,
      openDrawer: widget.openDrawer,
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

  Widget _buildContent(BuildContext context, Notifi notifi) {
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
              Expanded(
                child: TextCustom(
                  notifi.title ?? '',
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
                  TextCustom(
                    StringUtils.formatTime(
                            _dateNow.toString(), notifi.dateNotification)
                        .toString(),
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
          TextCustom(
            notifi.detail ?? '',
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
              TextCustom(
                '${ConstString.dateNews}: ${StringUtils.formatDate(notifi.datePost)}',
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
                  TextCustom(
                    '${ConstString.dayScore}: ${notifi.score}, ${ConstString.still} ${StringUtils.formatTime(notifi.dateEnd, _dateNow.toString())}',
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
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        if (state.notificationStatus is InitNotificationStatus) {
          return Container();
        }
        if (state.notificationStatus is NotificationStatusSuccess) {
          final lstNotification =
              (state.notificationStatus as NotificationStatusSuccess)
                  .lstNotification;
          return Padding(
            padding: const EdgeInsets.only(
              left: Dimens.heightSmall,
              right: Dimens.heightSmall,
              top: Dimens.marginView,
              bottom: Dimens.marginView,
            ),
            child: ListView.builder(
                itemCount: lstNotification.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    child: _buildContent(context, lstNotification[index]),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailNewsScreen(
                                    idNews: lstNotification[index].idNews!,
                                  )));
                    },
                  );
                }),
          );
        }
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDrawerOpen
          ? ConstColors.blueLight2
          : ConstColors.backGroundColor,
      appBar: _buildAppbar(),
      body: BlocProvider(
        create: (context) =>
            NotificationBloc()..add(LoadNotification(account: _account)),
        child: _buildBody(context),
      ),
    );
  }
}
