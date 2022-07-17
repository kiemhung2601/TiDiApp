import 'package:flutter/material.dart';
import 'package:socialworkapp/screens/contact/bloc/contact_status.dart';
import 'package:socialworkapp/untils/constants.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../untils/constant_string.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import '../../widgets/bottom_sheet_notification.dart';
import 'bloc/contact_bloc.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      transparent: true,
      isHomePage: false,
      title: ConstString.contact.toUpperCase(),
    );
  }

  Widget _buildAddress(BuildContext context, icon, String title,
      String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          icon,
          width: DimenUtilsPX.pxToPercentage(context, 32),
          height: DimenUtilsPX.pxToPercentage(context, 32),
        ),
        const SizedBox(
          width: Dimens.heightSmall,
        ),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: Dimens.heightSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustom(
                    '$title: ',
                    color: ConstColors.black.withOpacity(0.7),
                    maxLines: null,
                  ),
                  Expanded(
                    child: TextCustom(
                      content,
                      color: ConstColors.black,
                      fontWeight: true,
                      maxLines: null,
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }

  Widget _buildWorkTime(BuildContext context, icon, String title,
      String workTimeNormal, String workTimeSpecial) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          icon,
          width: DimenUtilsPX.pxToPercentage(context, 32),
          height: DimenUtilsPX.pxToPercentage(context, 32),
        ),
        const SizedBox(
          width: Dimens.heightSmall,
        ),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: Dimens.heightSmall),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustom(
                    '$title: ',
                    color: ConstColors.black.withOpacity(0.7),
                    maxLines: null,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(
                        workTimeNormal,
                        color: ConstColors.black,
                        fontWeight: true,
                        maxLines: null,
                      ),
                      TextCustom(
                        workTimeSpecial,
                        color: ConstColors.black,
                        fontWeight: true,
                        maxLines: null,
                      ),
                    ],
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget _buildInfor(BuildContext context, icon, String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          width: DimenUtilsPX.pxToPercentage(context, 32),
          height: DimenUtilsPX.pxToPercentage(context, 32),
        ),
        const SizedBox(
          width: Dimens.heightSmall,
        ),
        Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustom(
                  '$title: ',
                  color: ConstColors.black.withOpacity(0.7),
                  maxLines: null,
                ),
                Expanded(
                  child: TextCustom(
                    content,
                    color: ConstColors.black,
                    fontWeight: true,
                    maxLines: null,
                  ),
                )
              ],
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backGroundColor,
      appBar: _buildAppbar(),
      body: BlocProvider(
        create: (context) =>
        ContactBloc()
          ..add(const LoadInforContact()),
        child: BlocListener<ContactBloc, ContactState>(
          listener: (context, state) {
            if (state.contactStatus is ContactStatusFail) {
              final message = (state.contactStatus as ContactStatusFail).responseError.message;
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
          child: BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              if (state.contactStatus is InitContactStatus) {
                return Container();
              }
              if (state.contactStatus is ContactStatusSuccess) {
                final contact = (state.contactStatus as ContactStatusSuccess)
                    .contact;
                return Padding(
                  padding: const EdgeInsets.all(Dimens.marginView),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextCustom(
                          ConstString.schoolInfo,
                          fontWeight: true,
                          fontSize: Dimens.body,
                        ),
                        const SizedBox(
                          height: Dimens.sizedBox,
                        ),
                        _buildInfor(
                          context,
                          Images.school,
                          ConstString.school,
                          contact.sclname!,
                        ),
                        const SizedBox(
                          height: Dimens.sizedBox,
                        ),
                        _buildAddress(
                          context,
                          Images.locationCT,
                          ConstString.address,
                          contact.scladdress!,
                        ),
                        const SizedBox(
                          height: Dimens.sizedBox,
                        ),
                        _buildWorkTime(
                            context,
                            Images.workingTimeCT,
                            ConstString.timeWork,
                            contact.sclworktime!,
                            contact.sclworktimesunday!),
                        const SizedBox(
                          height: Dimens.sizedBox,
                        ),
                        _buildInfor(
                          context,
                          Images.phoneCT,
                          ConstString.hotLine,
                          contact.sclhotline!,
                        ),
                        const SizedBox(
                          height: Dimens.sizedBox,
                        ),
                        _buildInfor(
                          context,
                          Images.mailCT,
                          ConstString.mail,
                          contact.sclmail!,
                        ),
                        const SizedBox(
                          height: Dimens.sizedBox,
                        ),
                        _buildInfor(
                          context,
                          Images.website,
                          ConstString.webSite,
                          contact.sclweb!,
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
