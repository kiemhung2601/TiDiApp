import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:socialworkapp/screens/confirm_information/confirm_information_screen.dart';
import 'package:socialworkapp/screens/detail_news/widget/bloc/qr_scan_manager_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialworkapp/screens/detail_news/widget/bloc/qr_scan_manager_status.dart';

import '../../../untils/constant_string.dart';
import '../../../untils/constants.dart';
import '../../../untils/untils.dart';
import '../../../widgets/bottom_sheet_notification.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/text_widget.dart';

class QrScanManager extends StatefulWidget {
  final String idEvent;
  final String idTeacher;
  const QrScanManager(
      {Key? key, required this.idEvent, required this.idTeacher})
      : super(key: key);

  @override
  State<QrScanManager> createState() => _QrScanManagerState();
}

class _QrScanManagerState extends State<QrScanManager> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  late QrScanManagerBloc _qrScanManagerBloc;

  @override
  void initState() {
    _qrScanManagerBloc = QrScanManagerBloc();
    super.initState();
  }

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
        controller.pauseCamera();
        setState(() => this.barcode = barcode);
        _qrScanManagerBloc.add(CheckRollUpEvent(
            idEvent: widget.idEvent,
            idTeacher: widget.idTeacher,
            idUser: barcode.code ?? ''));
      }
    });
  }

  Widget _buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderRadius: Dimens.radius,
          borderColor: Colors.lightBlueAccent,
          borderLength: Dimens.sizedBox,
          borderWidth: Dimens.borderWidth,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  Widget _buildResult() => Container(
        padding: EdgeInsets.all(DimenUtilsPX.pxToPercentage(context, 12)),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Dimens.radius)),
          color: Colors.white24,
        ),
        child: Text(
          barcode != null
              ? '${ConstString.result} : ${barcode!.code}'
              : ConstString.scanCode,
          maxLines: 3,
          style: const TextStyle(color: Colors.white),
        ),
      );

  Widget _buildControlButtons() => Container(
        padding: EdgeInsets.symmetric(
            horizontal: DimenUtilsPX.pxToPercentage(context, 16)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.radius),
            color: Colors.white24),
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
            const SizedBox(
              width: Dimens.marginView,
            ),
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
    return BlocProvider(
      create: (context) => _qrScanManagerBloc,
      child: BlocListener<QrScanManagerBloc, QrScanManagerState>(
        listener: (context, state) {
          if (state.checkRollUpStatus is CheckRollUpLoadingStatus) {
            LoadingDialog.show(context);
          }
          if (state.checkRollUpStatus is CheckRollUpStatusSuccess) {
            final userScanned = (state.checkRollUpStatus as CheckRollUpStatusSuccess).userScanned;
            LoadingDialog.hide(context);
            Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConfirmInformationScreen(
                          userScanned: userScanned,
                          idEvent: widget.idEvent,
                          idTeacher: widget.idTeacher,)))
                .then((value) => controller?.resumeCamera());
          }
          if (state.checkRollUpStatus is CheckRollUpStatusFail) {
            LoadingDialog.hide(context);
            final message = (state.checkRollUpStatus as CheckRollUpStatusFail)
                .responseError
                .message;
            BottomSheetNotificationDialog.show(context, children: [
              const SizedBox(height: Dimens.marginView),
              TextCustom(
                message,
                fontWeight: true,
              ),
              const SizedBox(height: Dimens.marginView)
            ], pressClose: () {
              Navigator.of(context).pop();
              controller?.resumeCamera();
            });
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildQrView(context),
            Positioned(bottom: 10, child: _buildResult()),
            Positioned(top: 10, child: _buildControlButtons())
          ],
        ),
      ),
    );
  }
}
