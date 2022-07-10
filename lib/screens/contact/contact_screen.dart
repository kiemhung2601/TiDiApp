import 'package:flutter/material.dart';
import 'package:socialworkapp/untils/constants.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../untils/constant_string.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      transparent: true,
      isHomePage: false,
      title: ConstString.contact.toUpperCase(),
    );
  }

  Widget _buildInfor(BuildContext context, icon, String title, String content ){
    return Row(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          icon,
          width: DimenUtilsPX.pxToPercentage(context, 32),
          height: DimenUtilsPX.pxToPercentage(context, 32),
          // color: ConstColors.green,
        ),
        const SizedBox(width: Dimens.heightSmall,),
        Expanded(
            child: Container(
              margin: const EdgeInsets.only(top : Dimens.heightSmall),
              child: TextCustom(
                '$title: $content',
                color: ConstColors.black.withOpacity(0.7),
                maxLines: null,
              ),
            )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backGroundColor,
      appBar: _buildAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.marginView),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextCustom(ConstString.schoolInfo, fontWeight: true, fontSize: Dimens.body,),
              const SizedBox(height: Dimens.sizedBox,),
              _buildInfor(
                  context, Images.school, ConstString.school,
                  'Đại học Công nghệ Đồng Nai',
              ),
              const SizedBox(height: Dimens.sizedBox,),
              _buildInfor(
                  context, Images.locationCT, ConstString.address,
                  '206, Đường Nguyễn Khuyến, KP5, Phường Trảng Dài, TP Biên Hoà, Tỉnh Đồng Nai',
              ),
              const SizedBox(height: Dimens.sizedBox,),
              _buildInfor(
                  context, Images.workingTimeCT, ConstString.timeWork,
                  '\nThứ Hai	07:00–21:00 \nThứ Ba	07:00–21:00 \nThứ Tư	07:00–21:00 \nThứ Năm	07:00–21:00 \nThứ Sáu	07:00–21:00 \nThứ Bảy	07:00–21:00 \nChủ Nhật	07:00–17:00',
              ),
              const SizedBox(height: Dimens.sizedBox,),
              _buildInfor(
                  context, Images.phoneCT, ConstString.hotLine,
                  '0986 39 7733 - 0904 39 7733',
              ),
              const SizedBox(height: Dimens.sizedBox,),
              _buildInfor(
                  context, Images.mailCT, ConstString.mail,
                  'tuyensinh@dntu.edu.vn',
              ),const SizedBox(height: Dimens.sizedBox,),
              _buildInfor(
                  context, Images.website, ConstString.webSite,
                  'https://dntu.edu.vn/',
              ),

            ],
          ),
        ),
      ),
    );
  }
}
