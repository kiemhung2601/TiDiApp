import 'package:flutter/material.dart';
import 'package:socialworkapp/screens/detail_news/detail_news.dart';
import 'package:socialworkapp/screens/detail_news/widget/qr_scan_screen.dart';
import 'package:socialworkapp/untils/constants.dart';
import 'package:socialworkapp/widgets/information_widget.dart';

import '../../model/student.dart';
import '../../routes.dart';
import '../../untils/constant_string.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/information_location_widget.dart';

class ConfirmInformationScreen extends StatelessWidget {
  final bool admin;
  const ConfirmInformationScreen({Key? key, required this.admin})
      : super(key: key);
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
                  'https://i.pinimg.com/564x/ba/58/83/ba5883c68a1ffef7d29971eaa7686133.jpg')),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    Person person = Person(
      studentId: 141801773,
      name: 'Đặng Kiếm Hùng',
      studentClass: '18DTH5',
      studentMajor: 'Công nghệ thông tin',
      schoolYear: '2018-2022',
      address: 'Huỳnh Văn Nghệ, P.Bửu Long, TP.Biên Hòa, Đồng Nai',
      mail: 'kiemhung2601@gmail.com',
      phone: '0359882902',
      gender: 'Nam',
      dateBorn: '26/01/2000',
      urlImage:
          'https://i.pinimg.com/564x/ba/58/83/ba5883c68a1ffef7d29971eaa7686133.jpg',
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
              visible: admin == true,
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
                                  QrScanScreen()),
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
