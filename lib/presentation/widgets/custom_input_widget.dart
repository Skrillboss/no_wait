import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputWidget extends StatefulWidget {
  final String? hintText;
  final Icon? icon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomInputWidget({
    Key? key,
    this.hintText,
    this.icon,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  _CustomInputWidgetState createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  DateTime _selectedDate = DateTime.now();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  // Método para mostrar el dialogo de fecha
  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: CupertinoDatePicker(
          initialDateTime: _selectedDate,
          mode: CupertinoDatePickerMode.monthYear,
          use24hFormat: true,
          onDateTimeChanged: (DateTime newDate) {
            setState(() {
              _selectedDate = newDate;
              widget.controller?.text =
              '${_selectedDate.year}/${_selectedDate.month}';
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Verifica si el tipo de teclado es datetime
        if (widget.keyboardType == TextInputType.datetime) {
          _showDatePicker(context);
        }
      },
      child: AbsorbPointer(
        absorbing: widget.keyboardType == TextInputType.datetime,
        child: TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.icon,
            filled: true,
            fillColor: Theme.of(context).inputDecorationTheme.fillColor ??
                Theme.of(context).primaryColorLight.withOpacity(0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 15.0),
          ),
        ),
      ),
    );
  }
}
