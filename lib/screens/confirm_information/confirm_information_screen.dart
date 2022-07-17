import 'package:flutter/material.dart';
import 'package:socialworkapp/screens/detail_news/widget/qr_scan_screen.dart';
import 'package:socialworkapp/untils/constants.dart';
import 'package:socialworkapp/widgets/information_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/person.dart';
import '../../untils/constant_string.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import '../../widgets/bottom_sheet_notification.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/information_location_widget.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/text_widget.dart';
import 'bloc/confirm_information_bloc.dart';
import 'bloc/confirm_information_status.dart';

class ConfirmInformationScreen extends StatefulWidget {
  final String? idEvent;
  final String? idTeacher;
  final UserApp userScanned;

  const ConfirmInformationScreen({Key? key,
    this.idEvent = '',
    this.idTeacher = '',
    required this.userScanned})
      : super(key: key);

  @override
  State<ConfirmInformationScreen> createState() =>
      _ConfirmInformationScreenState();
}

class _ConfirmInformationScreenState extends State<ConfirmInformationScreen> {
  late ConfirmInformationBloc _confirmInformationBloc;

  @override
  void initState() {
    _confirmInformationBloc = ConfirmInformationBloc();
    super.initState();
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      transparent: true,
      isHomePage: false,
      title: ConstString.confirmInformation.toUpperCase(),
    );
  }

  Widget _buildImage(BuildContext context) {
    final imageSize = DimenUtilsPX.pxToPercentage(context, 343);
    return Center(
      child: Container(
        width: imageSize,
        height: imageSize,
        decoration: BoxDecoration(
          border:
          Border.all(width: 1, color: ConstColors.black.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(Dimens.radiusButton),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_960_720.png')),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      children: [
        InformationWidget(
          person: widget.userScanned,
          qrPush: true,
        ),
        const SizedBox(
          height: Dimens.heightSmall,
        ),
        InformationLocationWidget(person: widget.userScanned, qrPush: true),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildImage(context),
          const SizedBox(
            height: Dimens.sizedBox,
          ),
          _buildInfo(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backGroundColor,
      appBar: _buildAppbar(),
      body: BlocProvider(
        create: (context) => _confirmInformationBloc,
        child: BlocListener<ConfirmInformationBloc, ConfirmInformationState>(
          listener: (context, state) {
            if (state.rollUpStatus is RollUpLoadingStatus) {
              LoadingDialog.show(context);
            }
            if (state.rollUpStatus is RollUpStatusSuccess) {
              LoadingDialog.hide(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        QrScanScreen(idEvent: widget.idEvent!, idTeacher: widget.idTeacher!)),
              );
            }
            if (state.rollUpStatus is RollUpStatusFail) {
              LoadingDialog.hide(context);
              final message = (state.rollUpStatus as RollUpStatusFail)
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
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.marginView, vertical: Dimens.sizedBox),
            child: Column(
              children: [
                Expanded(
                  child: _buildBody(context),
                ),
                const SizedBox(
                  height: Dimens.marginView,
                ),
                Visibility(
                  visible: widget.userScanned.role == 2,
                  child: PrimaryButton(
                      text: ConstString.confirm.toUpperCase(),
                      onPressed: () {
                        AppUtils.showDialogCustom(
                            context: context,
                            title: ConstString.confirmRollUp,
                            strConfirm: ConstString.yes,
                            strCancel: ConstString.cancel,
                            onCancelClick: () {
                              Navigator.pop(context);
                            },
                            onConfirmClick: () {
                              Navigator.pop(context);
                              _confirmInformationBloc.add(RollUpEvent(
                                  idTeacher: widget.idTeacher!,
                                  idUser: widget.userScanned.id!,
                                  idEvent: widget.idEvent!));
                            });
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
