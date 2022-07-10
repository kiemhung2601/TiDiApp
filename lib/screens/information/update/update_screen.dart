import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socialworkapp/screens/home_main/home_main.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../untils/constant_string.dart';
import '../../../untils/constants.dart';
import '../../../untils/untils.dart';
import '../../../widgets/appbar_custom.dart';
import '../bloc/information_bloc.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final formKey = GlobalKey<FormState>();
  final FocusNode _focusAddress = FocusNode();
  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPhone = FocusNode();

  String _address = '';
  String _email = '';
  String _phone = '';

  void _onFocusChange() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  void initState() {
    super.initState();
    _focusAddress.addListener(_onFocusChange);
    _focusEmail.addListener(_onFocusChange);
    _focusPhone.addListener(_onFocusChange);
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      transparent: true,
      isHomePage: false,
      title: ConstString.informationLocation.toUpperCase(),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: Dimens.marginView),
          child: InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  AppUtils.showDialogCustom(
                      context: context,
                      title: ConstString.changeInformationAccount,
                      strConfirm: ConstString.yes,
                      strCancel: ConstString.cancel,
                      onCancelClick: () {
                        Navigator.pop(context);
                      },
                      onConfirmClick: () {
                        context.read<InformationBloc>().add(
                            ChangeInformationStudent(
                                address: _address,
                                email: _email,
                                phone: _phone));
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const HomeMain(
                                    currentTab: 3,
                                  )),
                          // ModalRoute.withName('/login'),
                        );
                      });
                }
              },
              child: const Center(
                child: TextCustom(
                  ConstString.save,
                  color: ConstColors.blueLight2,
                  fontWeight: true,
                ),
              )),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(Dimens.sizedBox),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                focusNode: _focusAddress,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimens.radius),
                  ),
                  filled: true,
                  fillColor: ConstColors.white.withOpacity(0.6),
                  labelText: '${ConstString.address} (${_address.length}/256)',
                  labelStyle: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: Dimens.body,
                    color: ConstColors.black,
                  ),
                  hintText: ConstString.address,
                  hintStyle: const TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.italic,
                      fontSize: Dimens.body,
                      fontWeight: FontWeight.bold),
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return ConstString.dontEmpty;
                  }
                  if (value.length > 256) {
                    return ConstString.addressMax;
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _address = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: Dimens.sizedBox,
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                focusNode: _focusEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimens.radius),
                  ),
                  filled: true,
                  fillColor: ConstColors.white.withOpacity(0.6),
                  labelText: '${ConstString.mail} (${_email.length}/320)',
                  labelStyle: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: Dimens.body,
                    color: ConstColors.black,
                  ),
                  hintText: ConstString.mail,
                  hintStyle: const TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.italic,
                      fontSize: Dimens.body,
                      fontWeight: FontWeight.bold),
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return ConstString.dontEmpty;
                  }
                  if (!RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(value)) {
                    return ConstString.emailError;
                  }
                  if (value.length > 320) {
                    return ConstString.emailMax;
                  }
                  if (value.contains(' ')) {
                    return ConstString.errorSpace;
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: Dimens.sizedBox,
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                focusNode: _focusPhone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimens.radius),
                  ),
                  filled: true,
                  fillColor: ConstColors.white.withOpacity(0.6),
                  labelText: '${ConstString.phone} (${_phone.length}/10)',
                  labelStyle: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: Dimens.body,
                    color: ConstColors.black,
                  ),
                  hintText: ConstString.phone,
                  hintStyle: const TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.italic,
                      fontSize: Dimens.body,
                      fontWeight: FontWeight.bold),
                ),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return ConstString.dontEmpty;
                  }
                  List<String> lstPhone = HeadPhone.headPhone();
                  int i;
                  bool checkPhone = false;
                  for (i = 0; i < lstPhone.length; i++) {
                    if (value.startsWith(lstPhone[i]) == true) {
                      checkPhone = true;
                      break;
                    }
                  }
                  if (checkPhone == false) {
                    return ConstString.errorPhone;
                  }
                  if (value.length < 10 || value.length > 10) {
                    return ConstString.phoneMax;
                  }
                  if (value.contains(' ')) {
                    return ConstString.errorSpace;
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _phone = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backGroundColor,
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }
}
