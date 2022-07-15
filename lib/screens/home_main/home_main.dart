import 'package:flutter/material.dart';
import 'package:socialworkapp/model/drawer_item.dart';
import 'package:socialworkapp/routes.dart';
import 'package:socialworkapp/screens/history/history_screen.dart';
import 'package:socialworkapp/screens/home/home_screen.dart';
import 'package:socialworkapp/screens/home_main/bloc/home_main_status.dart';
import 'package:socialworkapp/screens/information/information_screen.dart';
import 'package:socialworkapp/screens/notification/notification_screen.dart';
import 'package:socialworkapp/screens/qr_code/qr_main_screen.dart';
import 'package:socialworkapp/screens/settings/setting_screen.dart';
import 'package:socialworkapp/untils/constant_string.dart';
import 'package:socialworkapp/untils/constants.dart';
import 'package:socialworkapp/untils/untils.dart';
import 'package:socialworkapp/widgets/drawer_widget.dart';
import 'package:socialworkapp/widgets/tabbar_custom_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/person.dart';
import '../login/bloc/login_bloc.dart';
import '../news/news_screen.dart';
import 'bloc/home_main_bloc.dart';

class HomeMain extends StatefulWidget {
  final int? currentTab;
  const HomeMain({
    Key? key,
    this.currentTab = 0,
  }) : super(key: key);

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

  late Person _person;

  @override
  void initState() {
    _person = context.read<LoginBloc>().person!;
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
        xOffset = DimenUtilsPX.pxToPercentage(context, 230);
        yOffet = DimenUtilsPX.pxToPercentage(context, 150);
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
      body: BlocProvider(
        create: (context) =>
            HomeMainBloc()..add(LoadHomeMain(person: _person)),
        child: BlocBuilder<HomeMainBloc, HomeMainState>(
          builder: (context, state) {
            if (state.homeMainStatus is InitHomeMainStatus) {
              return Container();
            }
            if (state.homeMainStatus is HomeMainStatusSuccess) {
              final person =
                  (state.homeMainStatus as HomeMainStatusSuccess).person;
              return Stack(
                children: [
                  buildDrawer(person),
                  _buildTabs(),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget buildDrawer(Person person) => SafeArea(
          child: DrawerWidget(
        person: person,
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
            } else if (item == DrawerItems.settings) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
            } else if (item == DrawerItems.news) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NewsScreen()));
            }
          });
        },
      ));
}
