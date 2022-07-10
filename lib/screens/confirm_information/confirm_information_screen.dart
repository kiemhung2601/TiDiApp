import 'package:flutter/material.dart';
import 'package:socialworkapp/screens/detail_news/widget/qr_scan_screen.dart';
import 'package:socialworkapp/untils/constants.dart';
import 'package:socialworkapp/widgets/information_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/account.dart';
import '../../model/person.dart';
import '../../untils/constant_string.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/information_location_widget.dart';
import '../login/bloc/login_bloc.dart';

class ConfirmInformationScreen extends StatefulWidget {
  const ConfirmInformationScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmInformationScreen> createState() =>
      _ConfirmInformationScreenState();
}

class _ConfirmInformationScreenState extends State<ConfirmInformationScreen> {
  late Account _account;

  @override
  void initState() {
    _account = context.read<LoginBloc>().account;

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
    Person person = Person(
      studentId: '141801830',
      name: 'Doãn Văn Long',
      studentClass: '18DTH5',
      studentMajor: 'Công nghệ thông tin',
      schoolYear: '2018-2022',
      address: 'Trảng Dài, Thành phố Biên Hòa, Đồng Nai',
      mail: 'longdoan@gmail.com',
      phone: '01628332193',
      gender: 'Nam',
      dateBorn: '26/06/2000',
      urlImage:
          'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_960_720.png',
    );
    return Column(
      children: [
        InformationWidget(
          person: person,
          qrPush: true,
        ),
        const SizedBox(
          height: Dimens.heightSmall,
        ),
        InformationLocationWidget(person: person, qrPush: true),
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
      body: Padding(
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
              visible: _account.admin == true,
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const QrScanScreen()),
                          );
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
