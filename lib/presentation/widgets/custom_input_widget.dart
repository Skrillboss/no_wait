import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputWidget extends StatefulWidget {
  final String? hintText;
  final Icon? icon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isCardTypeInput;
  final TextInputType? keyboardType;

  const CustomInputWidget({
    super.key,
    this.hintText,
    this.icon,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.isCardTypeInput = false,
    this.keyboardType = TextInputType.text,
  }) : assert(!(isCardTypeInput && keyboardType == TextInputType.datetime),
            'You can\'t use isCardTypeInput as true when keyboardType is TextInputType.datetime');

  @override
  _CustomInputWidgetState createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  DateTime _selectedDate = DateTime.now();
  String _cardTypeView = '';
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _showCardTypePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        alignment: Alignment.topCenter,
        height: 250,
        color: Colors.white,
        child: SizedBox(
          height: 60,
          child: SegmentedButton(
            segments: const <ButtonSegment<String>>[
              ButtonSegment<String>(
                  value: 'MASTERCARD', label: Text('Mastercard', style: TextStyle(fontSize: 12),)),
              ButtonSegment<String>(value: 'VISA', label: Text('Visa')),
              ButtonSegment<String>(
                  value: 'AMERICAN_EXPRESS', label: Text('American Express')),
              ButtonSegment<String>(value: 'MAESTRO', label: Text('Maestro')),
            ],
            selected: <String>{_cardTypeView},
            onSelectionChanged: (Set<String> newSelection) {
              setState(() {
                _cardTypeView = newSelection.first;
                widget.controller?.text = newSelection.first;
              });
            },
            showSelectedIcon: false,
          ),
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: Colors.white,
        child: CupertinoDatePicker(
          initialDateTime: _selectedDate,
          mode: CupertinoDatePickerMode.monthYear,
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
        if (widget.isCardTypeInput) {
          _showCardTypePicker(context);
        }
        if (widget.keyboardType == TextInputType.datetime) {
          _showDatePicker(context);
        }
      },
      child: AbsorbPointer(
        absorbing: widget.keyboardType == TextInputType.datetime ||
            widget.isCardTypeInput,
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
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          ),
        ),
      ),
    );
  }
}
