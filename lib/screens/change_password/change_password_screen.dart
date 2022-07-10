import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socialworkapp/untils/constants.dart';
import 'package:socialworkapp/widgets/button_widget.dart';
import 'package:socialworkapp/widgets/text_widget.dart';

import '../../untils/constant_string.dart';
import '../../widgets/appbar_custom.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final FocusNode _focusPassWord = FocusNode();
  final FocusNode _focusRePassWord = FocusNode();

  String _passWord = '';
  bool _passwordVisible = true;

  String _rePassWord = '';
  bool _rePasswordVisible = true;

  void _onFocusChange() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  void initState() {
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

  Widget _buildNote(String note){
    return Row(
      children: [
        Icon(Icons.error, color: ConstColors.black.withOpacity(0.4),),
        const SizedBox(width: Dimens.heightSmall,),
        TextCustom(note, color: ConstColors.black.withOpacity(0.4),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backGroundColor,
      appBar: _buildAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.marginView, vertical: Dimens.sizedBox),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: ConstString.inputOldPassword,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible ? Icons.visibility : Icons
                                  .visibility_off,
                            ),
                            onPressed: () =>
                            {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              }),
                            },
                          ),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Hãy nhập mật khẩu vào";
                          }
                          if (value.contains(' ')) {
                            return "Mật khẩu không được phép có khoảng trắng";
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
                    const SizedBox(height: Dimens.sizedBox,),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        focusNode: _focusRePassWord,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _rePasswordVisible,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: ConstString.inputNewPassword,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _rePasswordVisible ? Icons.visibility : Icons
                                  .visibility_off,
                            ),
                            onPressed: () =>
                            {
                              setState(() {
                                _rePasswordVisible = !_rePasswordVisible;
                              }),
                            },
                          ),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Hãy nhập mật khẩu vào";
                          }
                          if (value.contains(' ')) {
                            return "Mật khẩu không được phép có khoảng trắng";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _rePassWord = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: Dimens.sizedBox,),
                    _buildNote('Tối thiểu 8 ký tự'),
                    const SizedBox(height: Dimens.marginView,),
                    _buildNote('Có chữ thường (a-z) & chữ in hoa (A-Z)'),
                    const SizedBox(height: Dimens.marginView,),
                    _buildNote('Ít nhất một số (0-9) hoặc ký hiệu (@#))'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(onPressed: () {  }, text: ConstString.changePassword,),
            )
          ],
        ),
      ),
    );
  }
}
