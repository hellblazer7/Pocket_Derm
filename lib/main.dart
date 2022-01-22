import 'package:flutter/material.dart';
import 'package:pocketdermtest/screens/loginscreen.dart';
import 'package:pocketdermtest/screens/signupscreen.dart';
import 'package:pocketdermtest/screens/uploadscreen.dart';
import 'package:pocketdermtest/screens/welcomescreen.dart';
import 'package:pocketdermtest/screens/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
  //
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:
          _auth.currentUser != null ? HomeScreen.id : WelcomeScreen.id,
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
