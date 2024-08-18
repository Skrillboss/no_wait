import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerView extends StatefulWidget {
  const QrScannerView({super.key});

  @override
  State<QrScannerView> createState() => _QrScannerViewState();
}

class _QrScannerViewState extends State<QrScannerView>
    with WidgetsBindingObserver {
  final MobileScannerController _mobileScannerController =
      MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates
      );

  StreamSubscription<Object?>? _subscription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MobileScanner(
          controller: _mobileScannerController,
      onDetect: (capture) {
        final List<Barcode> barcodes = capture.barcodes;
        for(final barcode in barcodes){
          print('The information of this barcode is: ${barcode.rawValue}');
        }
      },
    ));
  }

  @override
  Future<void> dispose() async {
    // Stop listening to lifecycle changes.
    WidgetsBinding.instance.removeObserver(this);
    // Stop listening to the barcode events.
    unawaited(_subscription?.cancel());
    _subscription = null;
    // Dispose the widget itself.
    super.dispose();
    // Finally, dispose of the controller.
  }
}
