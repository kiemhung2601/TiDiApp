import 'package:flutter/material.dart';
import 'package:socialworkapp/screens/contact/contact_screen.dart';
import 'package:socialworkapp/screens/information/bloc/information_bloc.dart';
import 'package:socialworkapp/screens/information/bloc/information_status.dart';
import 'package:socialworkapp/screens/settings/setting_screen.dart';
import 'package:socialworkapp/untils/constants.dart';
import 'package:socialworkapp/widgets/button_widget.dart';
import 'package:socialworkapp/widgets/information_widget.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/account.dart';
import '../../model/person.dart';
import '../../routes.dart';
import '../../untils/constant_string.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import '../../widgets/custom_nav.dart';
import '../../widgets/information_location_widget.dart';
import '../login/bloc/login_bloc.dart';

class InformationScreen extends StatefulWidget {
  final VoidCallback openDrawer;
  final bool isDrawerOpen;

  const InformationScreen({Key? key,
    required this.openDrawer,
    required this.isDrawerOpen})
      : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  late Account _account;

  @override
  void initState() {
    _account = context.read<LoginBloc>().account;
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

  Widget _buildBody(Person person) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimens.marginView,
        left: Dimens.heightSmall,
        right: Dimens.heightSmall,
      ),
      child: Column(
        children: [
          TextCustom(
            person.name,
            fontWeight: true,
          ),
          const SizedBox(
            height: Dimens.heightSmall,
          ),
          InformationWidget(admin: _account.admin, person: person),
          const SizedBox(
            height: Dimens.heightSmall,
          ),
          InformationLocationWidget(admin: _account.admin!, person: person),
          Visibility(
            visible: _account.admin == false,
            child: Column(
              children: [
                const SizedBox(
                  height: Dimens.heightSmall,
                ),
                CustomNav(
                  icon: Images.contact,
                  title: ConstString.contact,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactScreen()));
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: Dimens.heightSmall,
          ),
          CustomNav(
            icon: Images.settings,
            title: ConstString.settings,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
            },
          )
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
      body: BlocProvider(
        create: (context) => InformationBloc()..add(LoadInformationStudent(account: _account)),
        child: BlocBuilder<InformationBloc, InformationState>(
          builder: (context, state) {
            if (state.informationStatus is InitInformationStatus) {
              return Container();
            }
            if (state.informationStatus is InformationStatusSuccess) {
              final person =
                  (state.informationStatus as InformationStatusSuccess).person;
              return Padding(
                padding: const EdgeInsets.only(top: Dimens.paddingView),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(child: _buildImage(person.urlImage!)),
                      _buildBody(person),
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
      ),
    );
  }
}