import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socialworkapp/routes.dart';
import 'package:socialworkapp/untils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:socialworkapp/untils/untils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const int timeSplashSecond = 2;

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [ConstColors.blue, ConstColors.blueLight],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Images.logo,
                ),
                const SizedBox(height: Dimens.sizedBox),
                SizedBox(
                  width: DimenUtilsPX.pxToPercentage(context, 100),
                  height: DimenUtilsPX.pxToPercentage(context, 100),
                  child: Lottie.asset(Images.lottie,
                      fit: BoxFit.fill,
                      width: DimenUtilsPX.pxToPercentage(context, 100),
                      height: DimenUtilsPX.pxToPercentage(context, 100)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Timer? _timer;

  _navigateToHome() async {
    _timer = Timer(
        const Duration(seconds: timeSplashSecond),
        () => {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => RoutesPath.loginRoute),
                ModalRoute.withName('/login'),
              )
            });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }
}
