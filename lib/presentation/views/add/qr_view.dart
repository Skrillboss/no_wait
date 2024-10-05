import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_turno/presentation/provider/views_list_provider/views_list_provider.dart';
import '../../../features/item/domain/entities/item.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import 'item_view.dart';

class QrView extends StatefulWidget {
  final Item item;

  const QrView({super.key, required this.item});

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final ViewsListProvider viewsListProvider =
    Provider.of<ViewsListProvider>(context, listen: false);

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
              PrettyQrView.data(data: widget.item.id),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(150),
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).primaryColorDark,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 8),
                      elevation: 5,
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            'Compartir',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                    viewsListProvider.setQrScannerView = ItemView(itemProvided: widget.item)
                  },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(150),
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
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            'Prevista',
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
      ),
    );
  }
}
