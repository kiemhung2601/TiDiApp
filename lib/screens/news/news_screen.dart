import 'package:flutter/material.dart';
import 'package:socialworkapp/screens/detail_news/detail_news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialworkapp/screens/news/bloc/news_status.dart';

import '../../model/account.dart';
import '../../widgets/news_widget.dart';
import '../../untils/constant_string.dart';
import '../../untils/constants.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import '../../widgets/text_widget.dart';
import '../login/bloc/login_bloc.dart';
import 'bloc/news_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Account _account;

  @override
  void initState() {
    _account = context.read<LoginBloc>().account;
    super.initState();
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      isHomePage: false,
      actions: null,
      title: ConstString.titleNews.toUpperCase(),
    );
  }

  Widget _buildListNews(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if(state.newsStatus is InitNewsStatus){
          return Container();
        }
        if(state.newsStatus is NewsStatusSuccess){
          final lstNews = (state.newsStatus as NewsStatusSuccess).lstNews;
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
                      maxCrossAxisExtent: DimenUtilsPX.pxToPercentage(
                          context, 175),
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
                                  builder: (context) => DetailNewsScreen(idNews: lstNews[index].idNews!,)));
                        },
                      );
                    }),
              )
            ],
          );
        }
        return Container();
      },
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
      body: BlocProvider(
        create: (context) => NewsBloc()..add(LoadNews(account: _account)),
        child: Padding(
          padding: const EdgeInsets.only(
              right: Dimens.heightSmall,
              left: Dimens.heightSmall,
              top: Dimens.sizedBox,
              bottom: Dimens.sizedBox),
          child: _buildBody(context),
        ),
      ),
    );
  }
}