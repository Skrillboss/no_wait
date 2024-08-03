import 'package:flutter/material.dart';
import 'package:todo_turno/views/widgets/card_information.dart';
import '../../util/util.dart';
import '../widgets/custom_appbar.dart';
import 'abstract_screens/abstract_screen.dart';

class HomeScreen extends AbstractScreen {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends AbstractScreenState<HomeScreen>
    with AbstractScreenMixin {
  @override
  CustomAppBar appbarWidget() {
    return CustomAppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            // Acción al presionar el botón de configuración
          },
        ),
      ],
      canGoToHome: false,
      title: languageProvider.languageSelected.SHIFT,
    );
  }

  @override
  Widget bodyWidget() {
    return _shiftList();
  }

  Widget _shiftList() {
    final statusDetails = [CardInformation(shift: Util.getSampleShift())];

    return Center(
      child: Container(
        alignment: Alignment.topCenter,
        width: widthOfScreen * 0.95,
        margin: const EdgeInsets.only(top: 15),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: double.infinity),
          child: SingleChildScrollView(
            child: Column(children: statusDetails),
          ),
        ),
      ),
    );
  }
}
