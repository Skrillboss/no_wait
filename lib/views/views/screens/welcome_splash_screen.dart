import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_turno/config/constants/routes_constants.dart';

class WelcomeSplashScreen extends StatefulWidget {
  // final int pos;

  const WelcomeSplashScreen({
    super.key,
  });

  @override
  State<WelcomeSplashScreen> createState() => _WelcomeSplashScreenState();
}

class _WelcomeSplashScreenState extends State<WelcomeSplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);



    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(RoutesConstants.mainMenu);
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green, Colors.blue],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No Wait',
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }
}
