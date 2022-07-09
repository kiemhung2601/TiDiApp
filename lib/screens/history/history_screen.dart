import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socialworkapp/screens/detail_news/detail_news.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login/bloc/login_bloc.dart';
import '../../untils/constant_string.dart';
import '../../untils/constants.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import '../../widgets/search_custom.dart';

class HistoryScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  final bool isDrawerOpen;
  const HistoryScreen({Key? key, required this.openDrawer, required this.isDrawerOpen}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<String> menu = [
    ConstString.all,
    ConstString.register,
    ConstString.success,
    ConstString.failure
  ];
  int current = 0;

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      isHomePage: true,
      actions: null,
      title: ConstString.titleAppHistory.toUpperCase(), openDrawer: widget.openDrawer,
    );
  }

  Widget _buildImage(int index) {
    return Stack(
      children: [
        Container(
          width: DimenUtilsPX.pxToPercentage(context, 75),
          height: DimenUtilsPX.pxToPercentage(context, 75),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: ConstColors.black.withOpacity(0.1)),
            shape: BoxShape.circle,
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://i.pinimg.com/564x/ba/58/83/ba5883c68a1ffef7d29971eaa7686133.jpg'),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: SvgPicture.asset(
            index == 0
                ? Images.complete
                : index == 1 ? Images.fail
                             : index == 2 ? Images.register
                                          : Images.complete,
            width: DimenUtilsPX.pxToPercentage(
                context, 25),
            height: DimenUtilsPX.pxToPercentage(
                context, 25),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(int index) {
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
          _buildImage(index),
          const SizedBox(
            width: Dimens.sizedBox,
          ),
          Expanded(
            child: Column(
              children: [
                const TextCustom(
                  'Review trường đại học công nghệ đông nai như thế nào, học có tốt hay không, liệu có đáng để học?',
                  hadMaxLines: true,
                  maxLines: 2,
                  fontWeight: true,
                ),
                const SizedBox(
                  width: Dimens.heightSmall,
                ),
                const TextCustom(
                  'Review trường đại học công nghệ đông nai như thế nào, học có tốt hay không, liệu có đáng để học?',
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
                      '${ConstString.dayScoreNumber}: 5 ${ConstString.day}',
                      fontSize: Dimens.titleSmall,
                      color: ConstColors.black.withOpacity(0.5),
                    ),
                    TextCustom(
                      '${ConstString.status}: thất bại',
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
    final admin = context.read<LoginBloc>().admin;
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (_, index) {
          return InkWell(
            child: _buildContent(index),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailNewsScreen(admin: admin!)));
            },
          );
        });
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
        backgroundColor: widget.isDrawerOpen ? ConstColors.blueLight2 : ConstColors.backGroundColor,
        appBar: _buildAppbar(),
        body: GestureDetector(
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
                          width: DimenUtilsPX.pxToPercentage(
                              context, 19),
                          height: DimenUtilsPX.pxToPercentage(
                              context, 19),
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
        ));
  }
}
