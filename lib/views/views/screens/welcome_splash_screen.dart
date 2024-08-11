import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todo_turno/config/constants/routes_constants.dart';
import 'package:todo_turno/core/network/jwt_token_manager.dart';
import 'package:todo_turno/features/user/application/use_cases/login_user_token.dart';
import '../../../features/user/application/provider/user_provider.dart';

class WelcomeSplashScreen extends StatefulWidget {
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
    final LoginUserToken loginUserFromToken = GetIt.instance<LoginUserToken>();
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    GetIt.instance<JwtTokenManager>()
        .getRefreshToken()
        .then((refreshToken) async {
      if (refreshToken != null) {
        userProvider.setUser =
            await loginUserFromToken.call(refreshToken: refreshToken);
      }
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green, Colors.blue],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserProvider>(
              builder: (BuildContext context, userProvider, Widget? child) {
                return Text(
                  'Welcome\nto\nNo Wait\n${userProvider.getUser?.name ?? ''}',
                  style: const TextStyle(color: Colors.white, fontSize: 35),
                  textAlign: TextAlign.center,
                );
              },
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
