import 'package:flutter/material.dart';
import 'package:socialworkapp/screens/change_password/change_password_screen.dart';

import '../../untils/constant_string.dart';
import '../../untils/constants.dart';
import '../../widgets/appbar_custom.dart';
import '../../widgets/custom_nav.dart';
import '../../widgets/text_widget.dart';

class SettingsScreen extends StatefulWidget {
  final String id;
  const SettingsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      transparent: true,
      isHomePage: false,
      title: ConstString.settings.toUpperCase(),
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
              TextCustom(
                ConstString.coverUser,
                fontSize: Dimens.titleAppbar,
                color: ConstColors.black.withOpacity(0.6),
              ),
              const SizedBox(
                height: Dimens.sizedBox,
              ),
              CustomNav(
                icon: Images.passWord,
                title: ConstString.changePassword,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen(id: widget.id,)));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
