import 'package:flutter/material.dart';
import 'package:socialworkapp/screens/qr_code/widget/qr_code.dart';
import 'package:socialworkapp/screens/qr_code/widget/qr_scan.dart';
import 'package:socialworkapp/widgets/tabbar_custom_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/person.dart';
import '../../untils/constant_string.dart';
import '../../untils/constants.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import '../login/bloc/login_bloc.dart';
import 'bloc/qr_scan_bloc.dart';

class QrMainScreen extends StatefulWidget {
  final int? current;

  const QrMainScreen({Key? key, this.current = 0}) : super(key: key);

  @override
  State<QrMainScreen> createState() => _QrMainScreenState();
}

class _QrMainScreenState extends State<QrMainScreen> {
  late UserApp _person;

  List<String> lstTab = [
    ConstString.qrCode,
    ConstString.qrScan,
  ];

  List<String> lstImageTab = [Images.qrCode, Images.qrScan];

  int? current;

  @override
  void initState() {
    _person = context
        .read<LoginBloc>()
        .person!;
    current = widget.current;
    super.initState();
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      isHomePage: false,
      actions: null,
      title: ConstString.titleQr.toUpperCase(),
    );
  }

  Widget _buildTabBar() {
    return Column(
      children: [
        SizedBox(
          height: DimenUtilsPX.pxToPercentage(context, 60),
          width: double.infinity,
          child: Center(
            child: TabBarRadioCustom(
              lstTab: lstTab,
              current: current!,
              lstImageTab: lstImageTab,
              selectCurrent: (int select) {
                setState(() {
                  current = select;
                });
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.only(
        right: DimenUtilsPX.pxToPercentage(context, 20),
        left: DimenUtilsPX.pxToPercentage(context, 20),
      ),
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
      child: Padding(
        padding: const EdgeInsets.all(Dimens.marginView),
        child: current == 0
            ? QrCode(
          idAccount: _person.id!,
        )
            : QrScan(
          idAccount: _person.id!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backGroundColor,
      appBar: _buildAppbar(),
      body: BlocProvider(
        create: (context) => QrScanBloc(),
        child: Padding(
          padding: const EdgeInsets.only(
              right: Dimens.heightSmall,
              left: Dimens.heightSmall,
              top: Dimens.sizedBox,
              bottom: Dimens.sizedBox),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: _buildBody()),
              SizedBox(
                height: DimenUtilsPX.pxToPercentage(context, 40),
              ),
              _buildTabBar(),
            ],
          ),
        ),
      ),
    );
  }
}
