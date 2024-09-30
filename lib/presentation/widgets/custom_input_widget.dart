import 'package:flutter/material.dart';

class CustomInputWidget extends StatefulWidget {
  final String? hintText; // Mantengo el hintText
  final Icon? icon; // Mantengo el icono existente
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomInputWidget({
    Key? key,
    this.hintText, // hintText opcional
    this.icon, // icono opcional
    this.obscureText = false, // Por defecto no es un campo de contraseña
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  _CustomInputWidgetState createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText; // Inicializamos según el parámetro
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      // Controla si el texto está oculto o no
      decoration: InputDecoration(
        hintText: widget.hintText,
        // Agregamos el hintText
        prefixIcon: widget.icon,
        // Mantiene el ícono existente
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
        // Si no es un campo de contraseña, no mostramos el ícono del ojo
        filled: true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor ??
            Theme.of(context).primaryColorLight.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none, // Remove the border for a cleaner look
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      ),
    );
  }
}
