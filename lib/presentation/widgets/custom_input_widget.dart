import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_turno/presentation/widgets/tools/custom_keyboardType.dart';

class CustomInputWidget extends StatefulWidget {
  final String? hintText;
  final Icon? icon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final CustomKeyboardType customKeyboardType;
  final TextInputType? keyboardType;
  final Function(int)? onDurationChanged;
  final Function(String)? onDateChanged;

  const CustomInputWidget({
    super.key,
    this.hintText,
    this.icon,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.customKeyboardType = CustomKeyboardType.DEFAULT,
    this.keyboardType = TextInputType.text,
    this.onDurationChanged,
    this.onDateChanged,
  })  : assert(
            !(customKeyboardType == CustomKeyboardType.DURATION &&
                onDurationChanged == null),
            'onDurationChanged cannot be null when customKeyboardType is DURATION'),
        assert(
            !(customKeyboardType == CustomKeyboardType.MONTH_YEAR &&
                onDateChanged == null),
            'onDateChanged cannot be null when customKeyboardType is MONTH_YEAR');

  @override
  _CustomInputWidgetState createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  Duration _selectedDuration = const Duration(hours: 0, minutes: 0);
  int _rawDurationInMinutes = 0;
  String _rawDateFormated = '';
  DateTime _selectedDate = DateTime.now();
  String _cardTypeView = '';
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  String _formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    if (hours == 0) {
      return '${minutes.toString()} min.';
    }
    return '${hours.toString()}h ${minutes.toString()} min.';
  }

  void _showDurationPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) => Center(
          child: Container(
            alignment: Alignment.center,
            height: 400,
            child: DurationPicker(
              duration: _selectedDuration,
              onChange: (val) {
                setState(() {
                  _selectedDuration = val;
                  _rawDurationInMinutes = _selectedDuration.inMinutes;

                  widget.controller?.text = _formatDuration(_selectedDuration);

                  if (widget.onDurationChanged != null) {
                    widget.onDurationChanged!(_rawDurationInMinutes);
                  }
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showCardTypePicker(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (_) => Center(
        child: Container(
          alignment: Alignment.center,
          height: 250,
          color: Colors.white,
          child: SizedBox(
            height: 60,
            child: SegmentedButton(
              segments: const <ButtonSegment<String>>[
                ButtonSegment<String>(
                    value: 'MASTERCARD',
                    label: Text(
                      'Mastercard',
                      style: TextStyle(fontSize: 12),
                    )),
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
                  Navigator.pop(context);
                });
              },
              showSelectedIcon: false,
            ),
          ),
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

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
              _rawDateFormated =
                  dateFormat.parse(newDate.toString()).toString();
              if (widget.onDateChanged != null) {
                widget.onDateChanged!(_rawDateFormated);
              }
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        switch (widget.customKeyboardType) {
          case CustomKeyboardType.CARD_TYPE:
            _showCardTypePicker(context);
          case CustomKeyboardType.MONTH_YEAR:
            _showDatePicker(context);
          case CustomKeyboardType.DURATION:
            _showDurationPicker(context);
          case CustomKeyboardType.PHONE_NUMBER:
          // TODO: Handle this case.
          case CustomKeyboardType.DEFAULT:
        }
      },
      child: AbsorbPointer(
        absorbing: widget.customKeyboardType != CustomKeyboardType.DEFAULT,
        child: TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.customKeyboardType == CustomKeyboardType.DEFAULT
              ? widget.keyboardType
              : TextInputType.none,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.icon,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText =
                            !_obscureText; // Alternamos entre mostrar y ocultar
                      });
                    },
                  )
                : null,
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
