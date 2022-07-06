import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socialworkapp/screens/detail_news/detail_news.dart';
import 'package:socialworkapp/screens/qr_code/qr_main_screen.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/news_widget.dart';
import '../login/bloc/login_bloc.dart';
import '../../routes.dart';
import '../../untils/constant_string.dart';
import '../../untils/constants.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';

class HomeScreen extends StatelessWidget {
  final bool admin;
  final VoidCallback openDrawer;
  final bool isDrawerOpen;
  const HomeScreen(
      {Key? key,
      required this.admin,
      required this.openDrawer,
      required this.isDrawerOpen})
      : super(key: key);

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      isHomePage: true,
      actions: null,
      title: ConstString.titleAppHome.toUpperCase(),
      openDrawer: openDrawer,
    );
  }

  Widget _buildHeader(BuildContext context, String name, String score) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.radiusButton),
          color: ConstColors.white,
        ),
        padding: const EdgeInsets.only(
          top: Dimens.heightSmall,
          bottom: Dimens.heightSmall,
          left: Dimens.marginView,
          right: Dimens.marginView,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: DimenUtilsPX.pxToPercentage(context, 44),
                  height: DimenUtilsPX.pxToPercentage(context, 44),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: ConstColors.black.withOpacity(0.1)),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://media.istockphoto.com/photos/portrait-of-happy-asian-handsome-young-man-in-fashionable-clothing-picture-id1283231614?s=612x612'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: Dimens.marginView,
                ),
                TextCustom('${ConstString.hi}, $name'),
              ],
            ),
            const SizedBox(
              height: Dimens.marginView,
            ),
            Visibility(
              visible: admin == false,
              child: Row(
                children: [
                  SvgPicture.asset(
                    Images.scoreSocialWork,
                    width: DimenUtilsPX.pxToPercentage(context, 25),
                    height: DimenUtilsPX.pxToPercentage(context, 25),
                  ),
                  TextCustom('${ConstString.totalScore}: $score')
                ],
              ),
            ),
          ],
        ));
  }

  Widget _iconFlow(BuildContext context, String urlIcon, String topic) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          urlIcon,
          width: DimenUtilsPX.pxToPercentage(context, 48),
          height: DimenUtilsPX.pxToPercentage(context, 48),
        ),
        const SizedBox(
          height: Dimens.heightSmall,
        ),
        TextCustom(
          topic,
          fontWeight: true,
          fontSize: Dimens.titleSmall,
        ),
      ],
    );
  }

  Widget _buildListIconMenu(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          child: _iconFlow(context, Images.newsNav, ConstString.news),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RoutesPath.newsRoute));
          },
        ),
        InkWell(
          child: _iconFlow(context, Images.qrCodeNav, ConstString.qrCode),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const QrMainScreen(
                          current: 0,
                        )));
          },
        ),
        InkWell(
          child: _iconFlow(context, Images.qrScanNav, ConstString.qrScan),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const QrMainScreen(
                          current: 1,
                        )));
          },
        ),
      ],
    );
  }

  Widget _buildListIconMenuAdmin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          child: _iconFlow(context, Images.newsNav, ConstString.news),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RoutesPath.newsRoute));
          },
        ),
      ],
    );
  }

  Widget _buildMenu(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.radiusButton),
          color: ConstColors.white,
        ),
        padding: const EdgeInsets.only(
          top: Dimens.heightSmall,
          bottom: Dimens.heightSmall,
          left: Dimens.marginView,
          right: Dimens.marginView,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextCustom(
              ConstString.menuNav,
              fontWeight: true,
            ),
            const SizedBox(
              height: Dimens.marginView,
            ),
            admin
                ? _buildListIconMenuAdmin(context)
                : _buildListIconMenu(context),
          ],
        ));
  }

  Widget _buildBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radiusButton),
        color: ConstColors.white,
      ),
      padding: const EdgeInsets.only(
        top: Dimens.heightSmall,
        bottom: Dimens.heightSmall,
        left: Dimens.marginView,
        right: Dimens.marginView,
      ),
      child: Container(
        width: double.infinity,
        height: DimenUtilsPX.pxToPercentage(context, 97),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(width: 1, color: ConstColors.black.withOpacity(0.1)),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(Images.banner),
          ),
        ),
      ),
    );
  }

  Widget _buildListNews(BuildContext context) {
    final admin = context.read<LoginBloc>().admin;
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.radiusButton),
          color: ConstColors.white,
        ),
        padding: const EdgeInsets.only(
          top: Dimens.heightSmall,
          bottom: Dimens.heightSmall,
          left: Dimens.marginView,
          right: Dimens.marginView,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextCustom(
              ConstString.hotNews,
              fontWeight: true,
            ),
            const SizedBox(
              height: Dimens.marginView,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent:
                          DimenUtilsPX.pxToPercentage(context, 175),
                      childAspectRatio: 0.85,
                      mainAxisSpacing: Dimens.marginView,
                      crossAxisSpacing: Dimens.sizedBox,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: const NewsWidget(),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailNewsScreen(admin: admin!)));
                        },
                      );
                    }),
              ),
            )
          ],
        ));
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimens.heightSmall,
        right: Dimens.heightSmall,
        top: Dimens.marginView,
        bottom: Dimens.marginView,
      ),
      child: Column(
        children: [
          _buildHeader(context, 'Đặng Kiếm Hùng', '8.5'),
          const SizedBox(
            height: Dimens.heightSmall,
          ),
          _buildMenu(context),
          const SizedBox(
            height: Dimens.heightSmall,
          ),
          _buildBanner(context),
          const SizedBox(
            height: Dimens.heightSmall,
          ),
          Expanded(
            child: _buildListNews(context),
          ),
        ],
      ),
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
