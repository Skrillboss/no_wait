import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
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
  MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates);

  StreamSubscription<Object?>? _subscription;

  bool _hasCameraPermission = false;

  @override
  void initState() {
    super.initState();
    // Start listening to lifecycle changes.
    WidgetsBinding.instance.addObserver(this);

    // Check camera permission and start the scanner if permission is granted.
    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();

    setState(() {
      _hasCameraPermission = status == PermissionStatus.granted;
    });

    if (_hasCameraPermission) {
      // Start listening to the barcode events.
      _subscription = _mobileScannerController.barcodes.listen(_handleBarcode);

      // Start the scanner itself.
      unawaited(_mobileScannerController.start());
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // If the controller is not ready or permission is not granted, do not try to start or stop it.
    if (!_hasCameraPermission || !_mobileScannerController.autoStart) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        unawaited(_mobileScannerController.stop());
        unawaited(_subscription?.cancel());
        _subscription = null;
        break;
      case AppLifecycleState.resumed:
      // Restart the scanner when the app is resumed.
      // Don't forget to resume listening to the barcode events.
        _subscription =
            _mobileScannerController.barcodes.listen(_handleBarcode);
        unawaited(_mobileScannerController.start());
        break;
      case AppLifecycleState.inactive:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _hasCameraPermission
          ? MobileScanner(
          controller: _mobileScannerController, onDetect: _handleBarcode)
          : Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green, Colors.blue],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        child: const Center(
          child: Text(
            'Necesito los permisos de la cámara para continuar.',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Stop listening to lifecycle changes.
    WidgetsBinding.instance.removeObserver(this);
    // Stop listening to the barcode events.
    unawaited(_subscription?.cancel());
    _subscription = null;
    // Dispose the widget itself.
    super.dispose();
    // Finally, dispose of the controller.
    _mobileScannerController.dispose();
  }

  void _handleBarcode(BarcodeCapture barCodeCapture) {
    final List<Barcode> barcodes = barCodeCapture.barcodes;
    for (final barcode in barcodes) {
      print('The information of this barcode is: ${barcode.rawValue}');
    }
  }
}
