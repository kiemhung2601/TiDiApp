import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socialworkapp/widgets/text_widget.dart';

import '../untils/constant_string.dart';
import '../untils/constants.dart';
import '../untils/untils.dart';

class TabBarRadioCustom extends StatefulWidget {
  final List<String> lstTab;
  final List<String> lstImageTab;
  final int current;
  final Function(int select) selectCurrent;
  const TabBarRadioCustom(
      {Key? key,
      required this.lstTab,
      required this.current,
      required this.lstImageTab,
      required this.selectCurrent})
      : super(key: key);

  @override
  State<TabBarRadioCustom> createState() => _TabBarRadioCustomState();
}

class _TabBarRadioCustomState extends State<TabBarRadioCustom> {
  int current = 0;
  @override
  void initState() {
    current = widget.current;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.lstTab.length,
        itemBuilder: (ctx, index) {
          return InkWell(
            child: AnimatedContainer(
              padding: const EdgeInsets.all(Dimens.marginView),
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.all(Dimens.heightSmall),
              width: DimenUtilsPX.pxToPercentage(context, 140),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(Dimens.radiusButton),
                border: current == index
                    ? Border.all(color: ConstColors.blueLight, width: 2)
                    : null,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      widget.lstImageTab[index],
                      width: DimenUtilsPX.pxToPercentage(context, 25),
                      height: DimenUtilsPX.pxToPercentage(context, 25),
                    ),
                    const SizedBox(
                      width: Dimens.marginView,
                    ),
                    TextCustom(
                      widget.lstTab[index],
                      fontWeight: true,
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              setState(() {
                current = index;
                widget.selectCurrent(current);
              });
            },
          );
        });
  }
}

class TabBarCustom extends StatefulWidget {
  final TabController tabController;
  final Function(int select) selectCurrent;
  const TabBarCustom(
      {Key? key, required this.tabController, required this.selectCurrent})
      : super(key: key);

  @override
  State<TabBarCustom> createState() => _TabBarCustomState();
}

class _TabBarCustomState extends State<TabBarCustom> {
  @override
  Widget build(BuildContext context) {
    double paddingLeftText = DimenUtilsPX.pxToPercentage(context, 12);
    double imageSize = DimenUtilsPX.pxToPercentage(context, 25);
    double paddingTabVertical = DimenUtilsPX.pxToPercentage(context, 12);
    double paddingTabHorizontal = DimenUtilsPX.pxToPercentage(context, 15);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: DimenUtilsPX.pxToPercentage(context, 10),
        horizontal: DimenUtilsPX.pxToPercentage(context, 18),
      ),
      child: Row(
        children: [
          InkWell(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: widget.tabController.index == 0
                        ? [ConstColors.blue, ConstColors.blueLight]
                        : [Colors.transparent, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius:
                      BorderRadius.circular(Dimens.radiusTextFormField)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: paddingTabVertical,
                    horizontal: paddingTabHorizontal),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Images.homeTab,
                      width: imageSize,
                      height: imageSize,
                      color: widget.tabController.index == 0
                          ? ConstColors.white
                          : ConstColors.black,
                    ),
                    Visibility(
                      visible: widget.tabController.index == 0,
                      child: Padding(
                          padding: EdgeInsets.only(left: paddingLeftText),
                          child: TextCustom(
                            ConstString.titleAppHome,
                            color: widget.tabController.index == 0
                                ? ConstColors.white
                                : ConstColors.black,
                          )),
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              setState(() {
                widget.tabController.index = 0;
                widget.selectCurrent(widget.tabController.index);
              });
            },
          ),
          const Spacer(),
          InkWell(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: widget.tabController.index == 1
                        ? [ConstColors.blue, ConstColors.blueLight]
                        : [Colors.transparent, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius:
                      BorderRadius.circular(Dimens.radiusTextFormField)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: paddingTabVertical,
                    horizontal: paddingTabHorizontal),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Images.historyTab,
                      width: imageSize,
                      height: imageSize,
                      color: widget.tabController.index == 1
                          ? ConstColors.white
                          : ConstColors.black,
                    ),
                    Visibility(
                      visible: widget.tabController.index == 1,
                      child: Padding(
                          padding: EdgeInsets.only(left: paddingLeftText),
                          child: TextCustom(
                            ConstString.titleAppHistory,
                            color: widget.tabController.index == 1
                                ? ConstColors.white
                                : ConstColors.black,
                          )),
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              setState(() {
                widget.tabController.index = 1;
                widget.selectCurrent(widget.tabController.index);
              });
            },
          ),
          const Spacer(),
          InkWell(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: widget.tabController.index == 2
                        ? [ConstColors.blue, ConstColors.blueLight]
                        : [Colors.transparent, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius:
                      BorderRadius.circular(Dimens.radiusTextFormField)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: paddingTabVertical,
                    horizontal: paddingTabHorizontal),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Images.notificationTab,
                      width: imageSize,
                      height: imageSize,
                      color: widget.tabController.index == 2
                          ? ConstColors.white
                          : ConstColors.black,
                    ),
                    Visibility(
                      visible: widget.tabController.index == 2,
                      child: Padding(
                          padding: EdgeInsets.only(left: paddingLeftText),
                          child: TextCustom(
                            ConstString.titleAppNotification,
                            color: widget.tabController.index == 2
                                ? ConstColors.white
                                : ConstColors.black,
                          )),
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              setState(() {
                widget.tabController.index = 2;
                widget.selectCurrent(widget.tabController.index);
              });
            },
          ),
          const Spacer(),
          InkWell(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: widget.tabController.index == 3
                        ? [ConstColors.blue, ConstColors.blueLight]
                        : [Colors.transparent, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius:
                      BorderRadius.circular(Dimens.radiusTextFormField)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: paddingTabVertical,
                    horizontal: paddingTabHorizontal),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Images.informationTab,
                      width: imageSize,
                      height: imageSize,
                      color: widget.tabController.index == 3
                          ? ConstColors.white
                          : ConstColors.black,
                    ),
                    Visibility(
                      visible: widget.tabController.index == 3,
                      child: Padding(
                          padding: EdgeInsets.only(left: paddingLeftText),
                          child: TextCustom(
                            ConstString.information,
                            color: widget.tabController.index == 3
                                ? ConstColors.white
                                : ConstColors.black,
                          )),
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              setState(() {
                widget.tabController.index = 3;
                widget.selectCurrent(widget.tabController.index);
              });
            },
          ),
        ],
      ),
    );
  }
}

// class TabBarCus extends StatelessWidget {
//   final List<Widget> tabs;
//   final TabController tabController;
//
//   const TabBarCus({Key? key, required this.tabs, required this.tabController})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//           top: 10,
//           left: 18,
//           right: 18,
//           bottom: MediaQuery.of(context).padding.bottom),
//       child: Row(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 color: tabController.index == 0
//                     ? ConstColors.blueLight
//                     : Colors.transparent,
//                 borderRadius:
//                     BorderRadius.circular(Dimens.radiusTextFormField)),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.home,
//                     color: tabController.index == 0
//                         ? ConstColors.white
//                         : ConstColors.black,
//                   ),
//                   Visibility(
//                     visible: tabController.index == 0,
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 12),
//                       child: Text(
//                         'Home',
//                         style: TextStyle(
//                           color: tabController.index == 0
//                               ? ConstColors.white
//                               : ConstColors.black,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Spacer(),
//           Container(
//             decoration: BoxDecoration(
//                 color: tabController.index == 1
//                     ? ConstColors.blueLight
//                     : Colors.transparent,
//                 borderRadius:
//                 BorderRadius.circular(Dimens.radiusTextFormField)),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.home,
//                     color: tabController.index == 1
//                         ? ConstColors.white
//                         : ConstColors.black,
//                   ),
//                   Visibility(
//                     visible: tabController.index == 1,
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 12),
//                       child: Text(
//                         'Home',
//                         style: TextStyle(
//                           color: tabController.index == 1
//                               ? ConstColors.white
//                               : ConstColors.black,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Spacer(),
//           Container(
//             decoration: BoxDecoration(
//                 color: tabController.index == 2
//                     ? ConstColors.blueLight
//                     : Colors.transparent,
//                 borderRadius:
//                 BorderRadius.circular(Dimens.radiusTextFormField)),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.home,
//                     color: tabController.index == 2
//                         ? ConstColors.white
//                         : ConstColors.black,
//                   ),
//                   Visibility(
//                     visible: tabController.index == 2,
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 12),
//                       child: Text(
//                         'Home',
//                         style: TextStyle(
//                           color: tabController.index == 2
//                               ? ConstColors.white
//                               : ConstColors.black,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Spacer(),
//           Container(
//             decoration: BoxDecoration(
//                 color: tabController.index == 3
//                     ? ConstColors.blueLight
//                     : Colors.transparent,
//                 borderRadius:
//                 BorderRadius.circular(Dimens.radiusTextFormField)),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.home,
//                     color: tabController.index == 3
//                         ? ConstColors.white
//                         : ConstColors.black,
//                   ),
//                   Visibility(
//                     visible: tabController.index == 3,
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 12),
//                       child: Text(
//                         'Home',
//                         style: TextStyle(
//                           color: tabController.index == 3
//                               ? ConstColors.white
//                               : ConstColors.black,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
