import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:todo_turno/presentation/provider/views_list_provider/views_list_provider.dart';
import 'package:todo_turno/presentation/views/add/qr_select_function_view.dart';

import 'item_view.dart';

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
      body: Stack(
        children: [
          // Aquí va tu MobileScanner o el mensaje de permisos
          _hasCameraPermission
              ? mobileScanner()
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
          // Agregar un botón en la esquina superior izquierda
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
          ),
        ],
      ),
    );
  }

  Widget mobileScanner() {
    final ViewsListProvider viewsListProvider =
        Provider.of<ViewsListProvider>(context, listen: false);
    viewsListProvider.setQrScannerView = const QrSelectFunctionView();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.green, Colors.blue],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'AQUI DEBE HABER UNA IMAGEN\nBONITA DE UN SAPITO QUE\nREACCIONE AL TAP DEL USUARIO\nde Luis para Luis\n:)',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 400,
            width: 300,
            child: MobileScanner(
                controller: _mobileScannerController,
                onDetect: _handleBarcode,
                placeholderBuilder: (BuildContext context, Widget? child) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text("Loading camera...")
                      ],
                    ),
                  );
                },
                scanWindow: Rect.fromCenter(
                    center: const Offset(10.0, 20.0), height: 10, width: 10)),
          ),
        ],
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
    if (barcodes.first.rawValue != null) {
      final String itemId = barcodes.first.rawValue!;
      final ViewsListProvider viewsListProvider =
          Provider.of<ViewsListProvider>(context, listen: false);
      viewsListProvider.setQrScannerView = ItemView(itemId: itemId);
    } else {
      print(
          'Error, el valor esperado por el scan de tipo string ha recibido un null');
    }
  }
}
