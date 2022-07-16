import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../untils/constant_string.dart';
import '../../../untils/constants.dart';
import '../../../untils/untils.dart';
import '../../../widgets/appbar_custom.dart';
import '../../../widgets/bottom_sheet_notification.dart';
import '../../../widgets/loading_widget.dart';
import '../../login/bloc/login_bloc.dart';
import '../bloc/information_bloc.dart';
import '../bloc/information_status.dart';

class UpdateScreen extends StatefulWidget {
  final String id;
  const UpdateScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final formKeyAddress = GlobalKey<FormState>();
  final formKeyEmail = GlobalKey<FormState>();
  final formKeyPhone = GlobalKey<FormState>();
  final FocusNode _focusAddress = FocusNode();
  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPhone = FocusNode();

  bool checkChange = false;

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
                if (checkChange == true) {
                  if (checkValid() == true) {
                    AppUtils.showDialogCustom(
                        context: context,
                        title: ConstString.changeInformationAccount,
                        strConfirm: ConstString.yes,
                        strCancel: ConstString.cancel,
                        onCancelClick: () {
                          Navigator.pop(context);
                        },
                        onConfirmClick: () {
                          Navigator.pop(context);
                          context.read<InformationBloc>().add(
                              ChangeInformationStudent(
                                  id: widget.id,
                                  address: _address,
                                  email: _email,
                                  phone: _phone));
                        });
                  }
                }
              },
              child: Center(
                child: TextCustom(
                  ConstString.save,
                  color: checkChange
                      ? ConstColors.blueLight
                      : ConstColors.blueLight2,
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
      child: Column(
        children: [
          Form(
            key: formKeyAddress,
            child: SizedBox(
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
                  if (value!.length > 256) {
                    return ConstString.addressMax;
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _address = value;
                    if (_address.isNotEmpty ||
                        _email.isNotEmpty ||
                        _phone.isNotEmpty) {
                      checkChange = true;
                    } else {
                      checkChange = false;
                    }
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: Dimens.sizedBox,
          ),
          Form(
            key: formKeyEmail,
            child: SizedBox(
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
                  if (!RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(value!)) {
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
                    if (_address.isNotEmpty ||
                        _email.isNotEmpty ||
                        _phone.isNotEmpty) {
                      checkChange = true;
                    } else {
                      checkChange = false;
                    }
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: Dimens.sizedBox,
          ),
          Form(
            key: formKeyPhone,
            child: SizedBox(
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
                  List<String> lstPhone = HeadPhone.headPhone();
                  int i;
                  bool checkPhone = false;
                  for (i = 0; i < lstPhone.length; i++) {
                    if (value!.startsWith(lstPhone[i]) == true) {
                      checkPhone = true;
                      break;
                    }
                  }
                  if (checkPhone == false) {
                    return ConstString.errorPhone;
                  }
                  if (value!.length < 10 || value.length > 10) {
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
                    if (_address.isNotEmpty ||
                        _email.isNotEmpty ||
                        _phone.isNotEmpty) {
                      checkChange = true;
                    } else {
                      checkChange = false;
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backGroundColor,
      appBar: _buildAppbar(),
      body: BlocListener<InformationBloc, InformationState>(
        listener: (context, state) {
          if (state.updateInformationStatus is UpdateInformationLoadingStatus) {
            LoadingDialog.show(context);
          }
          if (state.updateInformationStatus is UpdateInformationStatusFail) {
            LoadingDialog.hide(context);
            final message =
                (state.updateInformationStatus as UpdateInformationStatusFail)
                    .responseError
                    .message;
            BottomSheetNotificationDialog.show(context, children: [
              const SizedBox(height: Dimens.marginView),
              TextCustom(
                message,
                fontWeight: true,
              ),
              const SizedBox(height: Dimens.marginView)
            ]);
          }
          if (state.updateInformationStatus is UpdateInformationStatusSuccess) {
            LoadingDialog.hide(context);
            context.read<LoginBloc>().person = (state.updateInformationStatus
                    as UpdateInformationStatusSuccess)
                .person;
            final message = (state.updateInformationStatus
                    as UpdateInformationStatusSuccess)
                .message;
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
        child: _buildBody(),
      ),
    );
  }

  bool checkValid() {
    bool checkValid = true;
    if (_address.isNotEmpty) {
      if (formKeyAddress.currentState!.validate() == false) {
        checkValid = false;
      }
    }
    if (_email.isNotEmpty) {
      if (formKeyEmail.currentState!.validate() == false) {
        checkValid = false;
      }
    }
    if (_phone.isNotEmpty) {
      if (formKeyPhone.currentState!.validate() == false) {
        checkValid = false;
      }
    }
    return checkValid;
  }
}
