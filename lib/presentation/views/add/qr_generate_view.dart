import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';
import 'package:todo_turno/presentation/views/add/qr_select_function_view.dart';
import '../../provider/views_list_provider/views_list_provider.dart';

class QrGenerateView extends StatefulWidget {
  const QrGenerateView({super.key});

  @override
  State<QrGenerateView> createState() => _QrGenerateViewState();
}

class _QrGenerateViewState extends State<QrGenerateView> {
  String? qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
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
                if (qrData != null) PrettyQrView.data(data: qrData!)
              ],
            ),
          ),
          Positioned(
            top: 24,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                final ViewsListProvider viewsListProvider =
                    Provider.of<ViewsListProvider>(context, listen: false);
                viewsListProvider.setQrScannerView =
                    const QrSelectFunctionView();
              },
            ),
          )
        ],
      ),
    );
  }
}
