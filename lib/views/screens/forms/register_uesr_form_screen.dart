import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../features/business/domain/entities/business.dart';
import '../../../features/paymentInfo/domain/entities/payment_info.dart';
import '../../../features/user/application/use_cases/login_user.dart';
import '../../../features/user/application/use_cases/register_user.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  _RegisterUserScreenState createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers para los campos de texto
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  RegisterUser registerUser = GetIt.instance<RegisterUser>();
  LoginUser loginUser = GetIt.instance<LoginUser>();

  PaymentInfo? _paymentInfo;
  Business? _business;

  @override
  void dispose() {
    _nameController.dispose();
    _nickNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {

        final user = await registerUser.call(
          name: _nameController.text,
          nickName: _nickNameController.text,
          email: _emailController.text,
          phoneNumber: _phoneNumberController.text,
          paymentInfo: _paymentInfo,  // Campos opcionales
          business: _business,  // Campos opcionales
        );
        
        

        // Manejar el éxito del registro (por ejemplo, navegación o mensaje de éxito)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bienvenido a NoWait ${user.name}'),
          duration: const Duration(seconds: 5),),
        );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nickNameController,
                decoration: const InputDecoration(labelText: 'Apodo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su apodo';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Correo electrónico'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su correo electrónico';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor ingrese un correo electrónico válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(labelText: 'Número de teléfono'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su número de teléfono';
                  }
                  if (!RegExp(r'^\d+$').hasMatch(value)) {
                    return 'Por favor ingrese un número de teléfono válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerUser,
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
