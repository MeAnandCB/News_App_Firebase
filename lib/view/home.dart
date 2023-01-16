// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../BottomNavigationBar.dart/BottamNavigationBar_Home/HomeNewsPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            elevation: 1,
            backgroundColor: const Color.fromARGB(255, 60, 4, 106),
            title: const Text(
              'Exit Confirmation',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              'Do you want to exit the App?',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                //return false when click on "NO"
                child: const Text('No'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                onPressed: () => Navigator.of(context).pop(true),
                //return true when click on "Yes"
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  //call function on back button press
  int currentindexValue = 0;
  static List<Widget> widgetOptions = <Widget>[
    HomeNewsPage(),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: WillPopScope(
        onWillPop: () => showExitPopup(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Find Your News Here'),
            backgroundColor: const Color.fromARGB(255, 60, 4, 106),
            actions: const [
              Icon(
                Icons.share,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.favorite_border_sharp,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          body: widgetOptions.elementAt(currentindexValue),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: const Color.fromARGB(255, 60, 4, 106),
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Heart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Settings',
              ),
            ],
            currentIndex: currentindexValue,
            onTap: (index) {
              setState(() {
                currentindexValue = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
