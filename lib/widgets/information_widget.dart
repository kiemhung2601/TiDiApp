import 'package:flutter/material.dart';
import 'package:socialworkapp/model/student.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../untils/constant_string.dart';
import '../untils/constants.dart';
import '../untils/untils.dart';
import 'bottom_sheet_notification.dart';

class InformationWidget extends StatelessWidget {
  final bool admin;
  final bool qrPush;
  final Person person;
  const InformationWidget(
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
                ConstString.informationPerson,
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
                      BottomSheetNotificationDialog.show(context, children: [
                        const SizedBox(height: Dimens.marginView),
                        const TextCustom(
                          ConstString.contactWithManager,
                          fontWeight: true,
                        ),
                        const SizedBox(height: Dimens.marginView)
                      ]);
                    }),
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
                  Images.person,
                  width: DimenUtilsPX.pxToPercentage(context, 32),
                  height: DimenUtilsPX.pxToPercentage(context, 32),
                ),
                const SizedBox(
                  width: Dimens.heightSmall,
                ),
                Expanded(
                    child: _buildInfor(ConstString.fullName, person.name!)),
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
                  Images.gender,
                  width: DimenUtilsPX.pxToPercentage(context, 32),
                  height: DimenUtilsPX.pxToPercentage(context, 32),
                ),
                const SizedBox(
                  width: Dimens.heightSmall,
                ),
                Expanded(
                  child: _buildInfor(ConstString.gender, person.gender!),
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
                  Images.dateBirthDay,
                  width: DimenUtilsPX.pxToPercentage(context, 32),
                  height: DimenUtilsPX.pxToPercentage(context, 32),
                ),
                const SizedBox(
                  width: Dimens.heightSmall,
                ),
                Expanded(
                    child: _buildInfor(ConstString.dateBorn, person.dateBorn!)),
              ],
            ),
          ),
          Visibility(
            visible: admin == false,
            child: SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    Images.studentCard,
                    width: DimenUtilsPX.pxToPercentage(context, 32),
                    height: DimenUtilsPX.pxToPercentage(context, 32),
                  ),
                  const SizedBox(
                    width: Dimens.heightSmall,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: Dimens.marginView,
                        ),
                        _buildInfor(ConstString.studentId,
                            person.studentId!.toString()),
                        const SizedBox(
                          height: Dimens.marginView,
                        ),
                        _buildInfor(
                            ConstString.studentClass, person.studentClass!),
                        const SizedBox(
                          height: Dimens.marginView,
                        ),
                        _buildInfor(ConstString.major, person.studentMajor!),
                        const SizedBox(
                          height: Dimens.marginView,
                        ),
                        _buildInfor(ConstString.schoolYear, person.schoolYear!),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
