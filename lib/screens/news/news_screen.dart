import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialworkapp/screens/detail_news/detail_news.dart';

import '../../widgets/news_widget.dart';
import '../login/bloc/login_bloc.dart';
import '../../untils/constant_string.dart';
import '../../untils/constants.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import '../../widgets/text_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      isHomePage: false,
      actions: null,
      title: ConstString.titleNews.toUpperCase(),
    );
  }

  // Widget _buildNews(BuildContext context) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       border: Border.all(width: 1, color: ConstColors.black.withOpacity(0.1)),
  //       borderRadius: BorderRadius.circular(Dimens.radiusButton),
  //       color: ConstColors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: ConstColors.black.withOpacity(0.2),
  //           spreadRadius: 0.1,
  //           blurRadius: 2,
  //           offset: const Offset(0, 3), // changes position of shadow
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       children: [
  //         Container(
  //           width: double.infinity,
  //           height: DimenUtilsPX.pxToPercentage(context, 138),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(10),
  //             border: Border.all(
  //                 width: 1, color: ConstColors.black.withOpacity(0.1)),
  //             image: const DecorationImage(
  //               fit: BoxFit.cover,
  //               image: AssetImage(Images.news),
  //             ),
  //           ),
  //         ),
  //         const Padding(
  //           padding: EdgeInsets.all(Dimens.heightSmall),
  //           child: TextCustom(
  //             'Thông tin tuyển sinh trường đại học công nghệ đồng nai',
  //             hadMaxLines: true,
  //             maxLines: 2,
  //             fontSize: Dimens.fontTab,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget _buildListNews(BuildContext context) {
    final admin = context.read<LoginBloc>().admin;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextCustom(
          'Bảng tin công tác xã hội',
          fontWeight: true,
        ),
        Padding(
          padding: const EdgeInsets.all(Dimens.marginView),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: DimenUtilsPX.pxToPercentage(context, 175),
                childAspectRatio: 0.85,
                mainAxisSpacing: Dimens.marginView,
                crossAxisSpacing: Dimens.sizedBox,
              ),
              itemCount: 20,
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
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: _buildListNews(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backGroundColor,
      appBar: _buildAppbar(),
      body: Padding(
        padding: const EdgeInsets.only(
            right: Dimens.heightSmall,
            left: Dimens.heightSmall,
            top: Dimens.sizedBox,
            bottom: Dimens.sizedBox),
        child: _buildBody(context),
      ),
    );
  }
}
