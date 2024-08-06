import 'package:flutter/material.dart';
import 'package:todo_turno/views/widgets/card_information.dart';
import 'package:todo_turno/views/widgets/custom_appbar.dart';
import '../../util/util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShiftsView extends StatelessWidget {
  const ShiftsView({super.key});

  @override
  Widget build(BuildContext context) {
    return _shiftList(context);
  }

  Widget _shiftList(BuildContext context) {
    final statusDetails = [CardInformation(shift: Util.getSampleShift())];

    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.shifts,
        actions: () {}, // Aquí también deberías colocar alguna acción o removerlo si no es necesario
      ),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.only(top: 15),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: double.infinity),
            child: SingleChildScrollView(
              child: Column(children: statusDetails),
            ),
          ),
        ),
      ),
    );
  }
}
