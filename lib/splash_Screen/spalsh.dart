import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(
            height: 300,
          ),
          FadeInImage(
            placeholder: AssetImage("assets/img/LOGO.png"),
            fadeInDuration: Duration(milliseconds: 500),
            image: AssetImage("assets/img/LOGO.png"),
            fadeOutDuration: Duration(seconds: 1),
            height: 230,
            width: 230,
          ),
          Spacer(),
          Center(
            child: Text(
              "Developed By  Anand CB",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
