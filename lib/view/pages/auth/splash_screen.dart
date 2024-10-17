import 'package:flutter/material.dart';
import '../../helpers/consts.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: FlutterSplashScreen.fadeIn(
          backgroundColor: mainColor,
          duration: const Duration(milliseconds: 6000),
          childWidget: Icon(
            Icons.shopping_cart_outlined,
            color: lightBackroundScreenColor,
            size:  size.width / 2 ,
          ),
          nextScreen: const SignInScreen(),
        ),
      ),
    );
  }
}
