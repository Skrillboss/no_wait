import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_turno/presentation/views/add/qr_scanner_view.dart';

import '../../provider/views_list_provider/views_list_provider.dart';

class QrSelectFunctionView extends StatefulWidget {
  const QrSelectFunctionView({super.key});

  @override
  _QrSelectFunctionViewState createState() => _QrSelectFunctionViewState();
}

class _QrSelectFunctionViewState extends State<QrSelectFunctionView> {
  @override
  Widget build(BuildContext context) {
    final ViewsListProvider viewsListProvider =
    Provider.of<ViewsListProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.blue],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'AQUI DEBE HABER UNA IMAGEN\nBONITA DE UN SAPITO QUE\nREACCIONE AL TAP DEL USUARIO\nde Luis para Luis\n:)',
              textAlign: TextAlign.center,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => {
                    viewsListProvider.setQrScannerView = const QrScannerView()
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(250),
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).primaryColorDark,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Bordes redondeados
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    elevation: 5, // Sombra del botón
                  ),
                  child: const Text(
                    'Escanear QR',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(250),
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).primaryColorDark,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Bordes redondeados
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    elevation: 5, // Sombra del botón
                  ),
                  child: const Text(
                    'Crear nuevo Item',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
