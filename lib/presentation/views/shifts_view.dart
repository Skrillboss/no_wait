import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/shift/domain/entities/shift.dart';
import '../../features/user/application/provider/user_provider.dart';
import '../widgets/card_information.dart';

class ShiftsView extends StatelessWidget {
  const ShiftsView({super.key});

  @override
  Widget build(BuildContext context) {
    return _shiftList(context);
  }

  Widget _shiftList(BuildContext context) {
    List<Shift?> statusDetails = [];

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
              child: Consumer<UserProvider>(
                builder: (context, userProvider, child) {
                  for (var i = 0;
                      i < userProvider.getUser!.shifts.length;
                      i++) {
                    statusDetails.add(userProvider.getUser!.shifts[i]);
                  }
                  return Column(
                    children: statusDetails
                        .map((shift) => CardInformation(shift: shift!))
                        .toList(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
