import 'package:flutter/cupertino.dart';

class GenerateStaceBetweenWidget{
  static Column widgetSpaceBuilder(List<Widget> listOfWidgets, double spaceBetween) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...List.generate(
          listOfWidgets.length,
              (index) {
            return Column(
              children: [
                listOfWidgets[index],
                if (index < listOfWidgets.length - 1)
                  SizedBox(height: spaceBetween),
              ],
            );
          },
        )
      ],
    );
  }
}