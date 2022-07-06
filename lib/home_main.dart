import 'package:flutter/material.dart';
import 'package:socialworkapp/model/drawer_item.dart';
import 'package:socialworkapp/routes.dart';
import 'package:socialworkapp/screens/history/history_screen.dart';
import 'package:socialworkapp/screens/home/home_screen.dart';
import 'package:socialworkapp/screens/information/information_screen.dart';
import 'package:socialworkapp/screens/notification/notification_screen.dart';
import 'package:socialworkapp/screens/qr_code/qr_main_screen.dart';
import 'package:socialworkapp/untils/constant_string.dart';
import 'package:socialworkapp/untils/constants.dart';
import 'package:socialworkapp/untils/untils.dart';
import 'package:socialworkapp/widgets/drawer_widget.dart';
import 'package:socialworkapp/widgets/tabbar_custom_widget.dart';

class HomeMain extends StatefulWidget {
  final bool admin;
  final int? currentTab;
  const HomeMain({Key? key, required this.admin, this.currentTab = 0})
      : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain>
    with SingleTickerProviderStateMixin {
  late double xOffset;
  late double yOffet;
  late double scaleFactor;
  late bool isDrawerOpen;
  DrawerItem item = DrawerItems.home;
  bool isDragging = false;

  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.index = widget.currentTab!;
    _selectedIndex = _tabController.index;
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
    super.initState();
    closeDrawer();
  }

  void openDrawer() => setState(() {
        xOffset = 230;
        yOffet = 150;
        scaleFactor = 0.6;
        isDrawerOpen = true;
      });

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffet = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  Widget _buildTabWithIndex() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen(
          openDrawer: openDrawer,
          isDrawerOpen: isDrawerOpen,
          admin: widget.admin,
        );
      case 1:
        return HistoryScreen(
          openDrawer: openDrawer,
          isDrawerOpen: isDrawerOpen,
        );
      case 2:
        return NotificationScreen(
          openDrawer: openDrawer,
          isDrawerOpen: isDrawerOpen,
        );
      case 3:
        return InformationScreen(
          openDrawer: openDrawer,
          isDrawerOpen: isDrawerOpen,
          admin: widget.admin,
        );
      default:
        return Container();
    }
  }

  Widget _buildTabs() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          openDrawer();
          return false;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragging) return;

          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < delta) {
            closeDrawer();
          }
          isDragging = false;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: Matrix4.translationValues(xOffset, yOffet, 0)
            ..scale(scaleFactor),
          child: AbsorbPointer(
            absorbing: isDrawerOpen,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(isDrawerOpen ? Dimens.radiusButton : 0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: _buildTabWithIndex()),
                      ],
                    ),
                  ),
                  Container(
                    color: ConstColors.white,
                    child: TabBarCustom(
                      selectCurrent: (int select) {
                        setState(() {
                          _selectedIndex = select;
                          _tabController.index = _selectedIndex;
                        });
                      },
                      tabController: _tabController,
                    ),
                  ),

                  // LayoutBuilder(
                  //   builder: (context, size) {
                  //     return TabBarCus(
                  //       tabs: [
                  //         SizedBox(
                  //             child: Tab(
                  //               child: Column(
                  //                 children: [
                  //                   SvgPicture.asset(
                  //                     Images.homeTab,
                  //                     width: DimenUtilsPX.pxToPercentage(
                  //                         context, 25),
                  //                     height: DimenUtilsPX.pxToPercentage(
                  //                         context, 25),
                  //                     color: _tabController.index == 0
                  //                         ? ConstColors.blue
                  //                         : ConstColors.black,
                  //                   ),
                  //                   const Text(
                  //                     ConstString.titleAppHome,
                  //                     maxLines: 2,
                  //                     textAlign: TextAlign.center,
                  //                     style: TextStyle(
                  //                         fontFamily: 'Roboto',
                  //                         fontSize: Dimens.fontTab,
                  //                         fontWeight: FontWeight.w400),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             width: (size.maxWidth / 4),
                  //             height:
                  //                 DimenUtilsPX.pxToPercentage(context, 50)),
                  //         SizedBox(
                  //             child: Tab(
                  //               child: Column(
                  //                 children: [
                  //                   SvgPicture.asset(
                  //                     Images.historyTab,
                  //                     width: DimenUtilsPX.pxToPercentage(
                  //                         context, 25),
                  //                     height: DimenUtilsPX.pxToPercentage(
                  //                         context, 25),
                  //                     color: _tabController.index == 1
                  //                         ? ConstColors.blue
                  //                         : ConstColors.black,
                  //                   ),
                  //                   const Text(
                  //                     ConstString.titleAppHistory,
                  //                     maxLines: 2,
                  //                     textAlign: TextAlign.center,
                  //                     style: TextStyle(
                  //                         fontFamily: 'Roboto',
                  //                         fontSize: Dimens.fontTab,
                  //                         fontWeight: FontWeight.w400),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             width: (size.maxWidth / 4),
                  //             height:
                  //                 DimenUtilsPX.pxToPercentage(context, 50)),
                  //         SizedBox(
                  //             child: Tab(
                  //               child: Column(
                  //                 children: [
                  //                   SvgPicture.asset(
                  //                     Images.notificationTab,
                  //                     width: DimenUtilsPX.pxToPercentage(
                  //                         context, 25),
                  //                     height: DimenUtilsPX.pxToPercentage(
                  //                         context, 25),
                  //                     color: _tabController.index == 3
                  //                         ? ConstColors.blue
                  //                         : ConstColors.black,
                  //                   ),
                  //                   const Text(
                  //                     ConstString.titleAppNotification,
                  //                     maxLines: 2,
                  //                     textAlign: TextAlign.center,
                  //                     style: TextStyle(
                  //                         fontFamily: 'Roboto',
                  //                         fontSize: Dimens.fontTab,
                  //                         fontWeight: FontWeight.w400),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             width: (size.maxWidth / 4),
                  //             height:
                  //                 DimenUtilsPX.pxToPercentage(context, 50)),
                  //         SizedBox(
                  //             child: Tab(
                  //               child: Column(
                  //                 children: [
                  //                   SvgPicture.asset(
                  //                     Images.informationTab,
                  //                     width: DimenUtilsPX.pxToPercentage(
                  //                         context, 25),
                  //                     height: DimenUtilsPX.pxToPercentage(
                  //                         context, 25),
                  //                     color: _tabController.index == 4
                  //                         ? ConstColors.blue
                  //                         : ConstColors.black,
                  //                   ),
                  //                   const Text(
                  //                     ConstString.information,
                  //                     maxLines: 2,
                  //                     textAlign: TextAlign.center,
                  //                     style: TextStyle(
                  //                         fontFamily: 'Roboto',
                  //                         fontSize: Dimens.fontTab,
                  //                         fontWeight: FontWeight.w400),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             width: (size.maxWidth / 4),
                  //             height:
                  //                 DimenUtilsPX.pxToPercentage(context, 50)),
                  //       ],
                  //       tabController: _tabController,
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.blueLight.withOpacity(0.6),
      body: Stack(
        children: [
          buildDrawer(),
          _buildTabs(),
        ],
      ),
    );
  }

  Widget buildDrawer() => SafeArea(
          child: DrawerWidget(
        pressBack: () {
          closeDrawer();
        },
        onSelectdItem: (item) {
          setState(() {
            closeDrawer();
            if (item == DrawerItems.home) {
              _tabController.index = 0;
              _selectedIndex = _tabController.index;
            } else if (item == DrawerItems.history) {
              _tabController.index = 1;
              _selectedIndex = _tabController.index;
            } else if (item == DrawerItems.notification) {
              _tabController.index = 2;
              _selectedIndex = _tabController.index;
            } else if (item == DrawerItems.information) {
              _tabController.index = 3;
              _selectedIndex = _tabController.index;
            } else if (item == DrawerItems.qrcode) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QrMainScreen(
                            current: 0,
                          )));
            } else if (item == DrawerItems.logOut) {
              AppUtils.showDialogCustom(
                  context: context,
                  title: ConstString.logOutAccount,
                  strConfirm: ConstString.yes,
                  strCancel: ConstString.cancel,
                  onCancelClick: () {
                    Navigator.pop(context);
                  },
                  onConfirmClick: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              RoutesPath.loginRoute),
                      ModalRoute.withName('/login'),
                    );
                  });
            }
          });
        },
      ));
}
