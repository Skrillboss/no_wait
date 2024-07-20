import 'package:flutter/material.dart';
import 'package:todo_turno/views/widgets/card_information.dart';

import '../../util/util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Turno"),
      ),
      body: _shiftList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción a realizar al presionar el botón
          print("¡Botón presionado!");
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _shiftList(){
    final statusDetails = [
      CardInformation(shift: Util.getSampleShift())
    ];

    return Container(
        width: 400,
        margin: const EdgeInsets.only(top: 15),
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 800),
            child: SingleChildScrollView(
              child: Column(children: statusDetails),
            )
        )
    );

  }
}
