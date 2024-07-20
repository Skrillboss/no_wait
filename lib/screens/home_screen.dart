import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navegar a la pantalla de configuración
            Navigator.pushNamed(context, '/settings');
          },
          child: const Text('Go to Settings'),
        ),
      ),
    );
  }
}
