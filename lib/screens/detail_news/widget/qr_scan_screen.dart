import 'package:flutter/material.dart';
import 'package:socialworkapp/screens/detail_news/widget/qr_scan_manager.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({Key? key}) : super(key: key);

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: QrScanManager(),
    );
  }
}
