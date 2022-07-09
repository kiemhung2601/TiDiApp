import 'package:flutter/material.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/student.dart';
import '../routes.dart';
import '../untils/constant_string.dart';
import '../untils/constants.dart';
import '../untils/untils.dart';

class InformationLocationWidget extends StatelessWidget {
  final bool admin;
  final bool qrPush;
  final Person person;
  const InformationLocationWidget(
      {Key? key, this.admin = false, this.qrPush = false, required this.person})
      : super(key: key);

  Widget _buildInfor(String topic, String data) {
    return Row(
      children: [
        TextCustom('$topic: '),
        Expanded(
          child: TextCustom(
            data,
            fontWeight: true,
            maxLines: 1,
            hadMaxLines: true,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radiusButton),
        color: ConstColors.white,
      ),
      padding: const EdgeInsets.all(Dimens.paddingView),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextCustom(
                ConstString.informationLocation,
                fontWeight: true,
              ),
              Visibility(
                visible: qrPush == true ? false : admin == false,
                child: InkWell(
                  child: const TextCustom(
                    ConstString.update,
                    fontWeight: true,
                    color: ConstColors.blueLight3,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RoutesPath.updateRoute));
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Dimens.marginView,
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.location,
                  width: DimenUtilsPX.pxToPercentage(context, 32),
                  height: DimenUtilsPX.pxToPercentage(context, 32),
                ),
                const SizedBox(
                  width: Dimens.heightSmall,
                ),
                Expanded(
                    child: _buildInfor(ConstString.address, person.address!)),
              ],
            ),
          ),
          const SizedBox(
            height: Dimens.heightSmall,
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.mail,
                  width: DimenUtilsPX.pxToPercentage(context, 32),
                  height: DimenUtilsPX.pxToPercentage(context, 32),
                ),
                const SizedBox(
                  width: Dimens.heightSmall,
                ),
                Expanded(
                  child: _buildInfor(ConstString.mail, person.mail!),
                )
              ],
            ),
          ),
          const SizedBox(
            height: Dimens.heightSmall,
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                SvgPicture.asset(
                  Images.phone,
                  width: DimenUtilsPX.pxToPercentage(context, 32),
                  height: DimenUtilsPX.pxToPercentage(context, 32),
                ),
                const SizedBox(
                  width: Dimens.heightSmall,
                ),
                Expanded(child: _buildInfor(ConstString.phone, person.phone!)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
