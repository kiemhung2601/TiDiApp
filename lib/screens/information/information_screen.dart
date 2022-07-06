import 'package:flutter/material.dart';
import 'package:socialworkapp/screens/information/bloc/information_bloc.dart';
import 'package:socialworkapp/screens/information/bloc/information_status.dart';
import 'package:socialworkapp/untils/constants.dart';
import 'package:socialworkapp/widgets/bottom_sheet_notification.dart';
import 'package:socialworkapp/widgets/button_widget.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/student.dart';
import '../../routes.dart';
import '../../untils/constant_string.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';

class InformationScreen extends StatefulWidget {
  final bool admin;
  final VoidCallback openDrawer;
  final bool isDrawerOpen;

  const InformationScreen(
      {Key? key, required this.admin, required this.openDrawer, required this.isDrawerOpen})
      : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  void initState() {
    context.read<InformationBloc>().add(const LoadInformationStudent());
    super.initState();
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      isHomePage: true,
      actions: null,
      title: ConstString.titleAppInformation.toUpperCase(),
      openDrawer: widget.openDrawer,
    );
  }

  Widget _buildImage(String urlImage) {
    return Container(
      width: DimenUtilsPX.pxToPercentage(context, 75),
      height: DimenUtilsPX.pxToPercentage(context, 75),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: ConstColors.black.withOpacity(0.1)),
        shape: BoxShape.circle,
        image:
            DecorationImage(fit: BoxFit.cover, image: NetworkImage(urlImage)),
      ),
    );
  }

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

  Widget _buildInformationPerson(Student student) {
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
                visible: widget.admin == false,
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
                        ConstString.contactWithManager, fontWeight: true,),
                      const SizedBox(height: Dimens.marginView)
                    ]);
                  }
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
                  Images.person,
                  width: DimenUtilsPX.pxToPercentage(context, 32),
                  height: DimenUtilsPX.pxToPercentage(context, 32),
                ),
                const SizedBox(
                  width: Dimens.heightSmall,
                ),
                Expanded(
                    child: _buildInfor(
                        ConstString.fullName, student.studentName!)),
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
                  child: _buildInfor(ConstString.gender, student.gender!),
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
                    child:
                        _buildInfor(ConstString.dateBorn, student.dateBorn!)),
              ],
            ),
          ),
          Visibility(
            visible: widget.admin == false,
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
                        _buildInfor(
                            ConstString.studentId, student.studentId!.toString()),
                        const SizedBox(
                          height: Dimens.marginView,
                        ),
                        _buildInfor(
                            ConstString.studentClass, student.studentClass!),
                        const SizedBox(
                          height: Dimens.marginView,
                        ),
                        _buildInfor(ConstString.major, student.studentMajor!),
                        const SizedBox(
                          height: Dimens.marginView,
                        ),
                        _buildInfor(ConstString.schoolYear, student.schoolYear!),
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

  Widget _buildInformationLocation(Student student) {
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
                visible: widget.admin == false,
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
                    child: _buildInfor(ConstString.address, student.address!)),
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
                  child: _buildInfor(ConstString.mail, student.mail!),
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
                Expanded(child: _buildInfor(ConstString.phone, student.phone!)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContact(String urlImage, String topic) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radiusButton),
        color: ConstColors.white,
      ),
      padding: const EdgeInsets.only(
        top: Dimens.heightSmall,
        bottom: Dimens.heightSmall,
        left: Dimens.marginView,
        right: Dimens.marginView,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(
                  urlImage,
                  width: DimenUtilsPX.pxToPercentage(context, 32),
                  height: DimenUtilsPX.pxToPercentage(context, 32),
                ),
                const SizedBox(
                  width: Dimens.heightSmall,
                ),
                TextCustom(
                  topic,
                  fontWeight: true,
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            Images.next,
            width: DimenUtilsPX.pxToPercentage(context, 32),
            height: DimenUtilsPX.pxToPercentage(context, 32),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(Student student) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimens.marginView,
        left: Dimens.heightSmall,
        right: Dimens.heightSmall,
      ),
      child: Column(
        children: [
          TextCustom(
            student.studentName,
            fontWeight: true,
          ),
          const SizedBox(
            height: Dimens.heightSmall,
          ),
          _buildInformationPerson(student),
          const SizedBox(
            height: Dimens.heightSmall,
          ),
          _buildInformationLocation(student),
          Visibility(
            visible: widget.admin == false,
            child: Column(
              children: [
                const SizedBox(
                  height: Dimens.heightSmall,
                ),
                _buildContact(Images.contact, ConstString.contact),
              ],
            ),
          ),
          const SizedBox(
            height: Dimens.heightSmall,
          ),
          _buildContact(Images.settings, ConstString.settings),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDrawerOpen
          ? ConstColors.blueLight2
          : ConstColors.backGroundColor,
      appBar: _buildAppbar(),
      body: BlocBuilder<InformationBloc, InformationState>(
        builder: (context, state) {
          if (state.informationStatus is InitInformationStatus) {
            return Container();
          }
          if (state.informationStatus is InformationStatusSuccess) {
            final student =
                (state.informationStatus as InformationStatusSuccess).student;
            return Padding(
              padding: const EdgeInsets.only(top: Dimens.paddingView),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(child: _buildImage(student.urlImage!)),
                    _buildBody(student),
                    const SizedBox(
                      height: Dimens.marginView,
                    ),
                    const TextCustom(
                      'Version 1.00.001',
                      fontSize: 10,
                    ),
                    const SizedBox(
                      height: Dimens.sizedBox,
                    ),
                    Center(
                      child: SizedBox(
                        width: DimenUtilsPX.pxToPercentage(context, 224),
                        height: DimenUtilsPX.pxToPercentage(context, 47),
                        child: PrimaryButton(
                          text: ConstString.signOut.toUpperCase(),
                          onPressed: () {
                            AppUtils.showDialogCustom(
                                context: context,
                                title: ConstString.logOutAccount,
                                strConfirm: ConstString.yes,
                                strCancel: ConstString.cancel,
                                onCancelClick: () {
                                  Navigator.pop(context);
                                },
                                onConfirmClick: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            RoutesPath.loginRoute),
                                    ModalRoute.withName('/login'),
                                  );
                                });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: Dimens.sizedBox,
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
