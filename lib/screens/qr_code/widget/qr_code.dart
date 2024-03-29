import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:socialworkapp/untils/constant_string.dart';

import '../../../untils/constants.dart';
import '../../../untils/untils.dart';
import '../../../widgets/text_widget.dart';

class QrCode extends StatelessWidget {
  final String idAccount;
  const QrCode({Key? key, required this.idAccount}) : super(key: key);

  Widget _buildQrView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextCustom(
          ConstString.giveQrForManager,
          fontWeight: true,
        ),
        const SizedBox(
          height: Dimens.sizedBox,
        ),
        QrImage(
          data: idAccount,
          size: DimenUtilsPX.pxToPercentage(context, 240),
          backgroundColor: Colors.white,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: _buildQrView(context));
  }
}
