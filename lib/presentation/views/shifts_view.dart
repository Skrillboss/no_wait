import 'package:flutter/material.dart';
import '../../util/util.dart';
import '../widgets/card_information.dart';

class ShiftsView extends StatelessWidget {
  const ShiftsView({super.key});

  @override
  Widget build(BuildContext context) {
    return _shiftList(context);
  }

  Widget _shiftList(BuildContext context) {
    final statusDetails = [CardInformation(shift: Util.getSampleShift())];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green, Colors.blue],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        alignment: Alignment.topCenter,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
            child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: double.infinity),
          child: SingleChildScrollView(
            child: Column(children: statusDetails),
          ),
        )),
      ),
    );
  }
}
