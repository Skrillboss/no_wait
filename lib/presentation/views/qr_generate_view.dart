import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrGenerateView extends StatefulWidget {
  const QrGenerateView({super.key});

  @override
  State<QrGenerateView> createState() => _QrGenerateViewState();
}

class _QrGenerateViewState extends State<QrGenerateView>{
  String? qrData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) => setState(() {
                qrData = value;
              }),
            ),
            if(qrData != null) PrettyQrView.data(data: qrData!)
          ],
        ),
      )
    );
  }
}
