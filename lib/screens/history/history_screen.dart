import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socialworkapp/screens/detail_news/detail_news.dart';
import 'package:socialworkapp/screens/history/bloc/history_status.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/account.dart';
import '../../model/history.dart';
import '../login/bloc/login_bloc.dart';
import '../../untils/constant_string.dart';
import '../../untils/constants.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import '../../widgets/search_custom.dart';
import 'bloc/history_bloc.dart';

class HistoryScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  final bool isDrawerOpen;

  const HistoryScreen(
      {Key? key, required this.openDrawer, required this.isDrawerOpen})
      : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late HistoryBloc _historyBloc;

  List<String> menu = [
    ConstString.all,
    ConstString.register,
    ConstString.success,
    ConstString.failure
  ];
  int current = 0;

  late Account _account;

  @override
  void initState() {
    _account = context.read<LoginBloc>().account;
    super.initState();
    _historyBloc = HistoryBloc();
    _historyBloc.add(LoadHistory(account: _account));
  }

  String status(int type) {
    String status = '';
    if (type == 0) {
      status = ConstString.complete;
    } else if (type == 1) {
      status = ConstString.fail;
    } else if (type == 2) {
      status = ConstString.register;
    }
    return status;
  }

  String imageStatus(int type) {
    String image = '';
    if (type == 0) {
      image = Images.register;
    } else if (type == 1) {
      image = Images.complete;
    } else if (type == 2) {
      image = Images.fail;
    }
    return image;
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      isHomePage: true,
      actions: null,
      title: ConstString.titleAppHistory.toUpperCase(),
      openDrawer: widget.openDrawer,
    );
  }

  Widget _buildImage(int index, String image, int type) {
    return Stack(
      children: [
        Container(
          width: DimenUtilsPX.pxToPercentage(context, 75),
          height: DimenUtilsPX.pxToPercentage(context, 75),
          decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: ConstColors.black.withOpacity(0.1)),
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: SvgPicture.asset(
            imageStatus(type),
            width: DimenUtilsPX.pxToPercentage(context, 25),
            height: DimenUtilsPX.pxToPercentage(context, 25),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(int index, History history) {
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
      child: Row(
        children: [
          _buildImage(index, history.image ?? '', history.type!),
          const SizedBox(
            width: Dimens.sizedBox,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustom(
                  history.title ?? '',
                  hadMaxLines: true,
                  maxLines: 2,
                  fontWeight: true,
                ),
                const SizedBox(
                  width: Dimens.heightSmall,
                ),
                TextCustom(
                  history.detail ?? '',
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
                      '${ConstString.dayScoreNumber}: ${history.score} ${ConstString.day}',
                      fontSize: Dimens.titleSmall,
                      color: ConstColors.black.withOpacity(0.5),
                    ),
                    TextCustom(
                      '${ConstString.status}: ${status(history.type!)}',
                      fontSize: Dimens.titleSmall,
                      color: ConstColors.black.withOpacity(0.5),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state.historyStatus is InitHistoryStatus) {
          return Container();
        }
        if (state.historyStatus is HistoryStatusSuccess) {
          final lstHistory =
              (state.historyStatus as HistoryStatusSuccess).lstHistory;
          return ListView.builder(
              itemCount: lstHistory.length,
              itemBuilder: (_, index) {
                return InkWell(
                  child: _buildContent(index, lstHistory[index]),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailNewsScreen(idNews: lstHistory[index].idNews!,)));
                  },
                );
              });
        }
        return Container();
      },
    );
  }

  Widget _buildTabBar() {
    return Column(
      children: [
        SizedBox(
          height: DimenUtilsPX.pxToPercentage(context, 60),
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: menu.length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  child: AnimatedContainer(
                    padding: const EdgeInsets.all(Dimens.marginView),
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.all(Dimens.heightSmall),
                    decoration: BoxDecoration(
                      color: ConstColors.white,
                      borderRadius: BorderRadius.circular(Dimens.radiusButton),
                      border: current == index
                          ? Border.all(color: ConstColors.blueLight, width: 4)
                          : null,
                    ),
                    child: Center(
                      child: TextCustom(
                        menu[index],
                        fontWeight: true,
                        color: current == index
                            ? ConstColors.black
                            : ConstColors.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      current = index;
                      if (index == 0) {
                        _historyBloc
                            .add(LoadHistory(account: _account));
                      } else if (index == 1) {
                        _historyBloc
                            .add(LoadHistory(account: _account, type: 0));
                      } else if (index == 2) {
                        _historyBloc
                            .add(LoadHistory(account: _account, type: 1));
                      } else if (index == 3) {
                        _historyBloc
                            .add(LoadHistory(account: _account, type: 2));
                      }
                    });
                  },
                );
              }),
        )
      ],
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
          create: (context) => _historyBloc,
          child: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: Dimens.heightSmall,
                right: Dimens.heightSmall,
                top: Dimens.sizedBox,
                bottom: Dimens.marginView,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: SearchCustom(
                          hintText: ConstString.search,
                        ),
                      ),
                      const SizedBox(
                        width: Dimens.marginView,
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            Images.filter,
                            width: DimenUtilsPX.pxToPercentage(context, 19),
                            height: DimenUtilsPX.pxToPercentage(context, 19),
                          ),
                          const TextCustom(
                            ConstString.filter,
                            fontWeight: true,
                            fontSize: Dimens.titleSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimens.marginView),
                  _buildTabBar(),
                  const SizedBox(height: Dimens.sizedBox),
                  Expanded(child: _buildBody()),
                ],
              ),
            ),
          ),
        ));
  }
}
