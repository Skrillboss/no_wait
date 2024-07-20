import 'package:flutter/material.dart';

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
      _shiftDetail('Titulo Informativo', 'VALOR'),
      _shiftDetail('Titulo Informativo', 'VALOR'),
      _shiftDetail('Titulo Informativo', 'VALOR'),
      _shiftDetail('Titulo Informativo', 'VALOR'),
      _shiftDetail('Titulo Informativo', 'VALOR'),
      _shiftDetail('Titulo Informativo', 'VALOR'),
      _shiftDetail('Titulo Informativo', 'VALOR'),
      _shiftDetail('Titulo Informativo', 'VALOR'),
    ];

    return Container(
        width: 400,
        margin: const EdgeInsets.only(top: 15),
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 800),
            child: SingleChildScrollView(
              child: Column(children: _buildShiftDetails(statusDetails)),
            )
        )
    );

  }

  List<Widget> _buildShiftDetails(List<Widget> statusDetails) {
    return statusDetails.expand((detail) => [detail, const SizedBox(height: 15)]).toList()..removeLast();
  }


  Widget _shiftDetail(String device, String status) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(device, style: const TextStyle(fontSize: 20, color: Colors.black)),
        Expanded(
          child: Text(
            status,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 20, color: Colors.amber),
          ),
        ),
      ],
    );
  }

}
