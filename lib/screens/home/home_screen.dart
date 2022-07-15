import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socialworkapp/screens/detail_news/detail_news.dart';
import 'package:socialworkapp/screens/home/bloc/home_status.dart';
import 'package:socialworkapp/screens/qr_code/qr_main_screen.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/person.dart';
import '../../widgets/news_widget.dart';
import '../login/bloc/login_bloc.dart';
import '../../routes.dart';
import '../../untils/constant_string.dart';
import '../../untils/constants.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  final bool isDrawerOpen;
  const HomeScreen(
      {Key? key, required this.openDrawer, required this.isDrawerOpen})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Person _person;

  @override
  void initState() {
    _person = context.read<LoginBloc>().person!;
    super.initState();
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      isHomePage: true,
      actions: null,
      title: ConstString.titleAppHome.toUpperCase(),
      openDrawer: widget.openDrawer,
    );
  }

  Widget _buildHeader(
      BuildContext context, String name, String score, String image) {
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
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image),
                    ),
                  ),
                ),
                const SizedBox(
                  width: Dimens.marginView,
                ),
                TextCustom(
                  '${ConstString.hi}, $name',
                  fontWeight: true,
                ),
              ],
            ),
            const SizedBox(
              height: Dimens.marginView,
            ),
            Visibility(
              visible: _person.role == 2,
              child: Row(
                children: [
                  SvgPicture.asset(
                    Images.scoreSocialWork,
                    width: DimenUtilsPX.pxToPercentage(context, 25),
                    height: DimenUtilsPX.pxToPercentage(context, 25),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextCustom('${ConstString.totalScore}: '),
                      TextCustom(
                        score,
                        fontWeight: true,
                      )
                    ],
                  ),
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
            _person.role == 1
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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.newsHomeStatus is InitNewsHomeStatus) {
          return Container();
        }
        if (state.newsHomeStatus is NewsHomeStatusSuccess) {
          final lstNews =
              (state.newsHomeStatus as NewsHomeStatusSuccess).lstNews;
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
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                DimenUtilsPX.pxToPercentage(context, 175),
                            childAspectRatio: 0.85,
                            mainAxisSpacing: Dimens.marginView,
                            crossAxisSpacing: Dimens.sizedBox,
                          ),
                          itemCount: lstNews.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: NewsWidget(news: lstNews[index]),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailNewsScreen(
                                              idNews: lstNews[index].idNews!,
                                            )));
                              },
                            );
                          }),
                    ),
                  )
                ],
              ));
        }
        return Container();
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.homeStatus is InitHomeStatus) {
          return Container();
        }
        if (state.homeStatus is HomeStatusSuccess) {
          final person = (state.homeStatus as HomeStatusSuccess).person;
          return Padding(
            padding: const EdgeInsets.only(
              left: Dimens.heightSmall,
              right: Dimens.heightSmall,
              top: Dimens.marginView,
              bottom: Dimens.marginView,
            ),
            child: Column(
              children: [
                _buildHeader(
                    context,
                    person.fullname ?? '',
                    person.swScore == null ? '' : person.swScore.toString(),
                    //Image
                    'https://i.pinimg.com/564x/ba/58/83/ba5883c68a1ffef7d29971eaa7686133.jpg'),
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
        create: (context) => HomeBloc()..add(LoadInfoHome(person: _person)),
        child: _buildBody(context),
      ),
    );
  }
}
