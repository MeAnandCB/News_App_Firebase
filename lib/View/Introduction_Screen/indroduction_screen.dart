import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Login_and_Signin/LogInPage.dart';

class Intro extends StatelessWidget {
  Intro({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Welcome to Find News news!',
      body:
          'Here, you can stay up-to-date on the latest news from around the world. Get the latest news and analysis from our team of expert reporters and editors.',
      image: Center(
        child: Image.asset('assets/img/welcome.png'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 21.0, fontWeight: FontWeight.bold, wordSpacing: 2),
      ),
    ),
    PageViewModel(
      title: 'Stay informed with the latest breaking news',
      body:
          "Stay informed with the latest breaking news and alerts. Our app will notify you of major events as they happen.",
      image: Center(
        child: Image.asset('assets/img/1stpage.png'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 21.0, fontWeight: FontWeight.bold, wordSpacing: 2),
      ),
    ),
    PageViewModel(
      title: 'Thanks for choosing our news app.!!',
      body:
          "We're dedicated to bringing you the latest and most accurate news from around the world. ",
      image: Center(
        child: Image.asset('assets/img/2nd.png'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 21.0, fontWeight: FontWeight.bold, wordSpacing: 2),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 60, 4, 106),
        title: Text("Let's Start"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: IntroductionScreen(
              pages: pages,
              dotsDecorator: const DotsDecorator(
                  size: Size(8, 12),
                  color: Color.fromARGB(255, 60, 4, 106),
                  activeColor: Color.fromARGB(255, 151, 70, 218),
                  activeSize: Size.square(15)),
              showDoneButton: true,
              done: const Text('Done',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 60, 4, 106),
                  )),
              showSkipButton: true,
              skip: const Text('Skip',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 60, 4, 106),
                  )),
              showNextButton: true,
              next: const Text('Next',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 60, 4, 106),
                  )),
              onDone: () => onDone(context),
              curve: Curves.bounceInOut),
        ),
      ),
    );
  }
}

void onDone(context) async {
  final preffer = await SharedPreferences.getInstance();
  await preffer.setBool('On_Boarding', false);
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => MyPhone()));
}
