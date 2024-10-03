import 'package:flutter/material.dart';
import '../../../features/item/domain/entities/item.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrView extends StatefulWidget {
  final Item item;

  const QrView({super.key, required this.item});

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green, Colors.blue],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'AQUI DEBE HABER UNA IMAGEN\nBONITA DE UN SAPITO QUE\nREACCIONE AL TAP DEL USUARIO\nde Luis para Luis\n:)',
                textAlign: TextAlign.center,
              ),
              PrettyQrView.data(data: widget.item.id)
            ],
          ),
        ),
      ),
    );
  }
}
