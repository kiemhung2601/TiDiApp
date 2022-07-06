import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socialworkapp/widgets/text_widget.dart';

import '../untils/constants.dart';
import '../untils/untils.dart';
import 'drawer_menu_widget.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  final bool isHomePage;
  final String? title;
  final Color iconColor;
  final bool transparent;
  final List<Widget>? actions;
  final VoidCallback? handleOnBack;
  final VoidCallback? openDrawer;

  const AppBarCustom(
      {Key? key,
      this.isHomePage = true,
      this.title,
      this.iconColor = Colors.white,
      this.actions,
      this.handleOnBack,
      this.openDrawer,
      this.transparent = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: transparent ? Colors.transparent : null,
      elevation: 0.0,
      flexibleSpace: transparent
          ? Container()
          : Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [ConstColors.blue, ConstColors.blueLight],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
            ),
      leading: (isHomePage)
          ? DrawerMenuWidget(
              onClicked: openDrawer,
            )
          : IconButton(
              icon: SvgPicture.asset(
                Images.back,
                width: DimenUtilsPX.pxToPercentage(context, 32),
                height: DimenUtilsPX.pxToPercentage(context, 32),
                color: transparent ? ConstColors.black : ConstColors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      title: TextCustom(
        title ?? '',
        fontWeight: true,
        fontSize: Dimens.titleAppbar,
        color: transparent ? ConstColors.black : ConstColors.white,
      ),
      centerTitle: true,
      actions: (actions != null)
          ? actions
          : [
              Container(),
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarCusHistory extends StatefulWidget {
  final List<String> contents;
  final int current;
  final Function(int quantity) select;
  const AppBarCusHistory(
      {Key? key,
      required this.contents,
      this.current = 0,
      required this.select})
      : super(key: key);

  @override
  State<AppBarCusHistory> createState() => _AppBarCusHistoryState();
}

class _AppBarCusHistoryState extends State<AppBarCusHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Dimens.heightSmall),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: DimenUtilsPX.pxToPercentage(context, 60),
            width: double.infinity,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.contents.length,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    child: Container(
                      margin: const EdgeInsets.all(Dimens.heightSmall),
                      width: DimenUtilsPX.pxToPercentage(context, 80),
                      height: DimenUtilsPX.pxToPercentage(context, 45),
                      decoration: const BoxDecoration(color: ConstColors.white),
                      child: Center(
                        child: TextCustom(widget.contents[index]),
                      ),
                    ),
                    onTap: widget.select(index),
                  );
                }),
          )
        ],
      ),
    );
  }
}
