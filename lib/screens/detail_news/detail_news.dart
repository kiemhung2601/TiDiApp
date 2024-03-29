import 'package:flutter/material.dart';
import 'package:socialworkapp/screens/detail_news/bloc/detail_news_status.dart';
import 'package:socialworkapp/screens/detail_news/widget/qr_scan_screen.dart';
import 'package:socialworkapp/widgets/button_widget.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/new.dart';
import '../../model/person.dart';
import '../../untils/date_time_format.dart';
import '../../widgets/bottom_sheet_notification.dart';
import '../../widgets/loading_widget.dart';
import '../home_main/home_main.dart';
import '../../untils/constant_string.dart';
import '../../untils/constants.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import '../login/bloc/login_bloc.dart';
import 'bloc/detail_news_bloc.dart';

class DetailNewsScreen extends StatefulWidget {
  final String idNews;
  const DetailNewsScreen({Key? key, required this.idNews}) : super(key: key);

  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  late UserApp _person;
  late DetailNewsBloc _detailNewsBloc;

  @override
  void initState() {
    _person = context.read<LoginBloc>().person!;
    _detailNewsBloc = DetailNewsBloc()
      ..add(LoadDetailNews(idNews: widget.idNews, idAccount: _person.id!));
    super.initState();
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      isHomePage: false,
      actions: null,
      title: ConstString.titleAppDetailNews.toUpperCase(),
    );
  }

  Widget _buildTextString(BuildContext context, String topic, String content) {
    return Row(
      children: [
        SvgPicture.asset(
          Images.stack,
          width: DimenUtilsPX.pxToPercentage(context, 14),
          height: DimenUtilsPX.pxToPercentage(context, 14),
        ),
        const SizedBox(
          width: Dimens.heightSmall,
        ),
        TextCustom(
          '$topic: ',
          fontSize: Dimens.body,
        ),
        TextCustom(
          content,
          fontSize: Dimens.body,
          fontWeight: true,
        )
      ],
    );
  }

  Widget _buildContent(String detail) {
    return Container(
      width: double.infinity,
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
      padding: const EdgeInsets.all(Dimens.marginView),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCustom(
              detail,
              maxLines: null,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: Dimens.marginView,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(News news) {
    if (_person.role == 1) {
      return PrimaryButton(
          text: ConstString.rollUp,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => QrScanScreen(idTeacher: _person.id!, idEvent: widget.idNews,)));
          });
    } else {
      if (news.status == -1) {
        return PrimaryButton(
            text: ConstString.register,
            onPressed: () {
              AppUtils.showDialogCustom(
                  context: context,
                  title: ConstString.registerEvent,
                  strConfirm: ConstString.yes,
                  strCancel: ConstString.cancel,
                  onCancelClick: () {
                    Navigator.pop(context);
                  },
                  onConfirmClick: () {
                    Navigator.pop(context);
                    _detailNewsBloc.add(ChangeTypeNewsEvent(
                        idnews: news.idNews!,
                        idAccount: _person.id!,
                        typeChange: 0));
                  });
            });
      }
      if (news.status == 0) {
        return SecondaryButton(
            text: ConstString.unRegister,
            onPressed: () {
              AppUtils.showDialogCustom(
                  context: context,
                  title: ConstString.unRegisterEvent,
                  strConfirm: ConstString.yes,
                  strCancel: ConstString.cancel,
                  onCancelClick: () {
                    Navigator.pop(context);
                  },
                  onConfirmClick: () {
                    Navigator.pop(context);
                    _detailNewsBloc.add(ChangeTypeNewsEvent(
                        idnews: news.idNews!,
                        idAccount: _person.id!,
                        typeChange: 1));
                  });
            });
      }
    }
    return Container();
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<DetailNewsBloc, DetailNewsState>(
      builder: (context, state) {
        if (state.detailNewsStatus is InitDetailNewsStatus) {
          return Container();
        }
        if (state.detailNewsStatus is DetailNewsStatusSuccess) {
          final news = (state.detailNewsStatus as DetailNewsStatusSuccess).news;
          return Column(
            children: [
              TextCustom(
                news.title ?? '',
                textAlign: TextAlign.center,
                fontSize: Dimens.titleAppbar,
                fontWeight: true,
              ),
              const SizedBox(
                height: Dimens.marginView,
              ),
              _buildTextString(context, ConstString.dateRegister,
                  formatDate(news.startDate ?? '')),
              const SizedBox(
                height: Dimens.heightSmall,
              ),
              _buildTextString(context, ConstString.dateEnd,
                  formatDate(news.endDate ?? '')),
              const SizedBox(
                height: Dimens.heightSmall,
              ),
              _buildTextString(
                  context, ConstString.scoreSocialWork, news.point.toString()),
              const SizedBox(
                height: Dimens.heightSmall,
              ),
              _buildTextString(
                  context, ConstString.namePost, news.namePost ?? ''),
              const SizedBox(
                height: Dimens.heightSmall,
              ),
              _buildTextString(
                  context, ConstString.position, news.position ?? ''),
              const SizedBox(
                height: Dimens.heightSmall,
              ),
              _buildTextString(context, ConstString.datePost,
                  formatDate(news.postDate ?? '')),
              const SizedBox(
                height: Dimens.heightSmall,
              ),
              _buildTextString(context, ConstString.numberRegister,
                  news.numberRegister.toString()),
              const SizedBox(
                height: Dimens.marginView,
              ),
              Expanded(
                child: _buildContent(news.description ?? ''),
              ),
              const SizedBox(
                height: Dimens.marginView,
              ),
              SizedBox(
                width: DimenUtilsPX.pxToPercentage(context, 155),
                child: _buildButton(news),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backGroundColor,
      appBar: _buildAppbar(),
      body: BlocProvider(
        create: (context) => _detailNewsBloc,
        child: BlocListener<DetailNewsBloc, DetailNewsState>(
          listener: (context, state) {
            if (state.changeStatusNewsStatus is ChangeStatusNewsLoadingStatus) {
              LoadingDialog.show(context);
            }
            if (state.changeStatusNewsStatus is ChangeStatusNewsStatusSuccess) {
              LoadingDialog.hide(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const HomeMain()),
              );
            }
            if (state.changeStatusNewsStatus is ChangeStatusNewsStatusFail) {
              LoadingDialog.hide(context);
              final message =
                  (state.changeStatusNewsStatus as ChangeStatusNewsStatusFail)
                      .responseError
                      .message;
              BottomSheetNotificationDialog.show(context, children: [
                const SizedBox(height: Dimens.marginView),
                TextCustom(
                  message,
                  fontWeight: true,
                ),
                const SizedBox(height: Dimens.marginView)
              ]);
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(
                right: Dimens.heightSmall,
                left: Dimens.heightSmall,
                top: Dimens.sizedBox,
                bottom: Dimens.sizedBox),
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }

  String formatDate(String? time) {
    return DateTimeFormatter.showDateFormat.format(DateTime.parse(time ?? ""));
  }
}
