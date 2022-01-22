import 'package:flutter/material.dart';
import 'package:pocketdermtest/constants.dart';
import 'package:pocketdermtest/components/roundedbutton.dart';
import 'package:pocketdermtest/screens/signupscreen.dart';
import 'package:pocketdermtest/screens/homescreen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 15.0,
                      ),
                      child: ImageIcon(
                        AssetImage('images/doctor_icon.png'),
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 60.0,
                      ),
                    ),
                  ],
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100.0),
                  bottomRight: Radius.circular(100.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 80.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 40.0,
            ),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {},
              decoration: kInputFieldDecoration.copyWith(
                hintText: 'Email',
                hintStyle: const TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 40.0,
            ),
            child: TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {},
              decoration: kInputFieldDecoration.copyWith(
                hintText: 'Password',
                hintStyle: const TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 80.0,
              ),
              child: RoundedButton(
                onPressed: () {

                  Navigator.popAndPushNamed(context, HomeScreen.id);
                },
                displayText: 'Submit',
                color: Colors.lightBlue.shade900,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0,
                vertical: 20.0,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, SignUpScreen.id);
                },
                child: const Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 70.0,
          ),
        ],
      ),
    );
  }
}
