import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socialworkapp/screens/change_password/bloc/change_password_status.dart';
import 'package:socialworkapp/untils/constants.dart';
import 'package:socialworkapp/widgets/button_widget.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../untils/constant_string.dart';
import '../../untils/untils.dart';
import '../../widgets/appbar_custom.dart';
import '../../widgets/bottom_sheet_notification.dart';
import '../../widgets/loading_widget.dart';
import 'bloc/change_password_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  final String id;

  const ChangePasswordScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final FocusNode _focusPassWord = FocusNode();
  final FocusNode _focusRePassWord = FocusNode();

  late ChangePasswordBloc _changePasswordBloc;

  String _passWord = '';
  bool _passwordVisible = true;

  String _newPassWord = '';
  bool _newPasswordVisible = true;

  void _onFocusChange() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  void initState() {
    _changePasswordBloc = ChangePasswordBloc();
    super.initState();
    _focusPassWord.addListener(_onFocusChange);
    _focusRePassWord.addListener(_onFocusChange);
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBarCustom(
      transparent: true,
      isHomePage: false,
      title: ConstString.changePassword.toUpperCase(),
    );
  }

  Widget _buildNote(String note) {
    return Row(
      children: [
        Icon(
          Icons.error,
          color: ConstColors.black.withOpacity(0.4),
          size: DimenUtilsPX.pxToPercentage(context, 24),
        ),
        const SizedBox(
          width: Dimens.heightSmall,
        ),
        SizedBox(
          width: DimenUtilsPX.pxToPercentage(context, 280),
          child: TextCustom(
            note,
            fontSize: Dimens.title,
            color: ConstColors.black.withOpacity(0.4),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backGroundColor,
      appBar: _buildAppbar(),
      body: BlocProvider(
        create: (context) => _changePasswordBloc,
        child: BlocListener<ChangePasswordBloc, ChangePasswordState>(
          listener: (context, state) {
            if (state.changePasswordStatus is ChangePasswordLoadingStatus) {
              LoadingDialog.show(context);
            }
            if (state.changePasswordStatus is ChangePasswordStatusFail) {
              LoadingDialog.hide(context);
              final message =
                  (state.changePasswordStatus as ChangePasswordStatusFail)
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
            if (state.changePasswordStatus is ChangePasswordStatusSuccess) {
              LoadingDialog.hide(context);
              final message =
                  (state.changePasswordStatus as ChangePasswordStatusSuccess)
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
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.marginView, vertical: Dimens.sizedBox),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Form(
                            key: formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    focusNode: _focusPassWord,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: _passwordVisible,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: ConstString.inputOldPassword,
                                      prefixIcon: const Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () => {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          }),
                                        },
                                      ),
                                    ),
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return ConstString.inputPassword;
                                      }
                                      if (value.contains(' ')) {
                                        return ConstString.inputSpacerPassword;
                                      }
                                      if (!RegExp(
                                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$')
                                          .hasMatch(value)) {
                                        return ConstString.errorPass;
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        _passWord = value;
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
                                    focusNode: _focusRePassWord,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: _newPasswordVisible,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: ConstString.inputNewPassword,
                                      prefixIcon: const Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _newPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () => {
                                          setState(() {
                                            _newPasswordVisible =
                                                !_newPasswordVisible;
                                          }),
                                        },
                                      ),
                                    ),
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return ConstString.inputPassword;
                                      }
                                      if (value.contains(' ')) {
                                        return ConstString.inputSpacerPassword;
                                      }
                                      if (!RegExp(
                                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$')
                                          .hasMatch(value)) {
                                        return ConstString.errorPass;
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        _newPassWord = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: Dimens.sizedBox,
                        ),
                        _buildNote(ConstString.minPass),
                        const SizedBox(
                          height: Dimens.marginView,
                        ),
                        _buildNote(ConstString.upperPass),
                        const SizedBox(
                          height: Dimens.marginView,
                        ),
                        _buildNote(ConstString.specialPass),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    onPressed: () {
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
                              Navigator.pop(context);
                              _changePasswordBloc.add(ChangePasswordAccount(
                                  id: widget.id,
                                  password: _passWord,
                                  newPassword: _newPassWord));
                            });
                      }
                    },
                    text: ConstString.changePassword,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
