import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import "package:salahlypackage/screens/login_signup/signupscreen.dart";

class SplashScreen extends StatefulWidget {
  static final routeName = "/splashcreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          child: Image.asset('assets/images/logo1.png'),
        ),
      ),
    );
  }
}
