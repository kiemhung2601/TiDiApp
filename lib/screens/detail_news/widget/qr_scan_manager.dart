import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialworkapp/screens/confirm_information/confirm_information_screen.dart';
import 'package:socialworkapp/screens/detail_news/detail_news.dart';

import '../../login/bloc/login_bloc.dart';
import '../../../untils/constants.dart';
import '../../../untils/untils.dart';

class QrScanManager extends StatefulWidget {
  const QrScanManager({Key? key}) : super(key: key);

  @override
  State<QrScanManager> createState() => _QrScanManagerState();
}

class _QrScanManagerState extends State<QrScanManager> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream
    // .listen((barcode) => setState(() => this.barcode = barcode));
        .listen((barcode) async {
      if (mounted) {
        final admin = context.read<LoginBloc>().admin;
        controller.pauseCamera();
        setState(() => this.barcode = barcode);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ConfirmInformationScreen(admin: admin!)))
            .then((value) => controller.resumeCamera());
      }
    });
  }

  Widget _buildQrView(BuildContext context) => QRView(
    key: qrKey,
    onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      borderRadius: 10,
      borderColor: Colors.lightBlueAccent,
      borderLength: 20,
      borderWidth: 10,
      cutOutSize: MediaQuery.of(context).size.width * 0.8,
    ),
  );

  Widget _buildResult() => Container(
    padding: const EdgeInsets.all(12),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.white24,
    ),
    child: Text(
      barcode != null ? 'Result : ${barcode!.code}' : 'Scan a code',
      maxLines: 3,
      style: const TextStyle(color: Colors.white),
    ),
  );

  Widget _buildControlButtons() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.white24),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
            child: FutureBuilder<bool?>(
              future: controller?.getFlashStatus(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return SvgPicture.asset(
                    Images.flash,
                    width: DimenUtilsPX.pxToPercentage(context, 22),
                    height: DimenUtilsPX.pxToPercentage(context, 22),
                    color: ConstColors.white.withOpacity(0.4),
                  );
                } else {
                  return Container();
                }
              },
            ),
            onTap: () async {
              await controller?.toggleFlash();
              setState(() {});
            }),
        const SizedBox(width: Dimens.marginView,),
        InkWell(
            child: FutureBuilder(
              future: controller?.getCameraInfo(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return SvgPicture.asset(
                    Images.changeCamera,
                    width: DimenUtilsPX.pxToPercentage(context, 35),
                    height: DimenUtilsPX.pxToPercentage(context, 35),
                    color: ConstColors.white.withOpacity(0.4),
                  );
                } else {
                  return Container();
                }
              },
            ),
            onTap: () async {
              await controller?.flipCamera();
              setState(() {});
            }),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildQrView(context),
        Positioned(bottom: 10, child: _buildResult()),
        Positioned(top: 10, child: _buildControlButtons())
      ],
    );
  }
}
