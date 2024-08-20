import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_turno/features/item/application/use_cases/read_item.dart';
import '../../features/item/domain/entities/item.dart';

class ItemView extends StatefulWidget {
  final String itemId;

  const ItemView({super.key, required this.itemId});

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  final ReadItem readItem = GetIt.instance<ReadItem>();
  Item? item;

  @override
  void initState() {
    super.initState();
    unawaited(readItem.call(itemId: widget.itemId).then((value) {
      setState(() {
        item = value;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.blue],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: item != null
            ? Text(
                'EL NOMBRE DEL ITEM QUE ACABAS DE ESCANEAR ES \n ${item!.name}')
            : const CircularProgressIndicator(),
      ),
    );
  }
}
