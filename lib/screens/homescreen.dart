import 'package:flutter/material.dart';
import 'package:pocketdermtest/screens/uploadscreen.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Center(
                        child: Text(
                          'PocketDerm',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40.0,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {

                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.power_settings_new,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
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
          const Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage(
                  'images/doctor_photo_2.png',
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, UploadScreen.id);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const ImageIcon(
                        AssetImage('images/hospital_icon_2.png'),
                        size: 50.0,
                        color: Colors.pink,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Center(
                          child: Text(
                            'Run diagnosis',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.lightBlue.shade900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
