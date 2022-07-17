import 'package:flutter/material.dart';
import 'package:socialworkapp/screens/detail_news/widget/qr_scan_manager.dart';

class QrScanScreen extends StatefulWidget {
  final String idEvent;
  final String idTeacher;
  const QrScanScreen({Key? key, required this.idEvent, required this.idTeacher}) : super(key: key);

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QrScanManager(idTeacher: widget.idTeacher, idEvent: widget.idEvent,),
    );
  }
}
