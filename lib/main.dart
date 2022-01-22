import 'package:flutter/material.dart';
import 'package:pocketdermtest/screens/loginscreen.dart';
import 'package:pocketdermtest/screens/signupscreen.dart';
import 'package:pocketdermtest/screens/uploadscreen.dart';
import 'package:pocketdermtest/screens/welcomescreen.dart';
import 'package:pocketdermtest/screens/homescreen.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        UploadScreen.id: (context) => const UploadScreen(),
      },
    );
  }
}
