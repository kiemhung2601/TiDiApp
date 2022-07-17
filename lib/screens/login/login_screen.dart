import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socialworkapp/screens/home_main/home_main.dart';
import 'package:socialworkapp/screens/login/bloc/login_status.dart';
import 'package:socialworkapp/untils/constant_string.dart';
import 'package:socialworkapp/widgets/button_widget.dart';
import 'package:socialworkapp/widgets/text_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../untils/constants.dart';
import '../../untils/untils.dart';
import '../../widgets/bottom_sheet_notification.dart';
import '../../widgets/loading_widget.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final FocusNode _focusUser = FocusNode();
  final FocusNode _focusPassword = FocusNode();

  String _userName = '';
  String _passWord = '';

  void _onFocusChange() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  void initState() {
    super.initState();
    _focusUser.addListener(_onFocusChange);
    _focusPassword.addListener(_onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if(state.loginStatus is LoginLoadingStatus){
            LoadingDialog.show(context);
          }
          if (state.loginStatus is LoginStatusSuccess) {
            LoadingDialog.hide(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeMain()));
          }
          if (state.loginStatus is LoginStatusFail) {
            LoadingDialog.hide(context);
            final message = (state.loginStatus as LoginStatusFail).responseError.message;
            BottomSheetNotificationDialog.show(context, children: [
              const SizedBox(height: Dimens.marginView),
              TextCustom(
                message,
                fontWeight: true,
              ),
              const SizedBox(height: Dimens.marginView)
            ]);
            context.read<LoginBloc>().add(InitialEvent());
          }
        },
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [ConstColors.blue, ConstColors.blueLight],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: DimenUtilsPX.pxToPercentage(context, 80),
                    ),
                    SvgPicture.asset(
                      Images.logo,
                      width: DimenUtilsPX.pxToPercentage(context, 100),
                      height: DimenUtilsPX.pxToPercentage(context, 100),
                    ),
                    SizedBox(
                      height: DimenUtilsPX.pxToPercentage(context, 40),
                    ),
                    SizedBox(
                      width: DimenUtilsPX.pxToPercentage(context, 318),
                      child: TextCustom(
                        ConstString.studentPortal.toUpperCase(),
                        color: ConstColors.white,
                        fontWeight: true,
                        fontSize: Dimens.titleBigest,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: DimenUtilsPX.pxToPercentage(context, 40),
                    ),
                    SizedBox(
                      width: DimenUtilsPX.pxToPercentage(context, 318),
                      child: TextFormField(
                        focusNode: _focusUser,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                Dimens.radiusTextFormField),
                          ),
                          filled: true,
                          fillColor: ConstColors.white.withOpacity(0.6),
                          hintText: ConstString.userId,
                          hintStyle: const TextStyle(
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.italic,
                              fontSize: Dimens.body,
                              color: ConstColors.white,
                              fontWeight: FontWeight.bold),
                          icon: SvgPicture.asset(
                            Images.user,
                            width: DimenUtilsPX.pxToPercentage(context, 32),
                            height: DimenUtilsPX.pxToPercentage(context, 32),
                          ),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return ConstString.dontEmpty;
                          }
                          if (value.contains(
                                  RegExp(r'[!@#$%^&*(),.?":{}|<>+/_~=`]')) ||
                              value.contains(RegExp(r'[A-Z]'))) {
                            return ConstString.errorSpecial;
                          }
                          if (value.contains(' ')) {
                            return ConstString.errorSpace;
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _userName = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: Dimens.sizedBox,
                    ),
                    SizedBox(
                      width: DimenUtilsPX.pxToPercentage(context, 318),
                      child: TextFormField(
                        focusNode: _focusPassword,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                Dimens.radiusTextFormField),
                          ),
                          filled: true,
                          fillColor: ConstColors.white.withOpacity(0.6),
                          hintText: ConstString.password,
                          hintStyle: const TextStyle(
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.italic,
                              fontSize: Dimens.body,
                              color: ConstColors.white,
                              fontWeight: FontWeight.bold),
                          icon: SvgPicture.asset(
                            Images.passWord,
                            width: DimenUtilsPX.pxToPercentage(context, 32),
                            height: DimenUtilsPX.pxToPercentage(context, 32),
                          ),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return ConstString.dontEmpty;
                          }
                          if (value.contains(' ')) {
                            return ConstString.errorSpace;
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
                    SizedBox(
                      height: DimenUtilsPX.pxToPercentage(context, 30),
                    ),
                    SizedBox(
                      width: DimenUtilsPX.pxToPercentage(context, 253),
                      height: DimenUtilsPX.pxToPercentage(context, 52),
                      child: PrimaryButton(
                          text: ConstString.signIn.toUpperCase(),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<LoginBloc>().add(LoginAccountEvent(user: _userName, passWord: _passWord));
                            }
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
