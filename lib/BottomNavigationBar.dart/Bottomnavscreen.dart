import 'package:flutter/material.dart';

import '../Screens/Home_Screen/home.dart';
import 'HomeNewsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
    HomeScreen(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 50,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 60, 4, 106),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                      Icons.home,
                      color: Color.fromARGB(255, 160, 61, 202),
                      size: 30,
                    )
                  : const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 25,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                      Icons.favorite_border,
                      color: Color.fromARGB(255, 160, 61, 202),
                      size: 30,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 25,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 160, 61, 202),
                      size: 30,
                    )
                  : const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 25,
                    ),
            ),
            // IconButton(
            //   enableFeedback: false,
            //   onPressed: () {
            //     setState(() {
            //       pageIndex = 3;
            //     });
            //   },
            //   icon: pageIndex == 3
            //       ? const Icon(
            //           Icons.person,
            //           color: Colors.white,
            //           size: 35,
            //         )
            //       : const Icon(
            //           Icons.person_outline,
            //           color: Colors.white,
            //           size: 35,
            //         ),
            // ),
          ],
        ),
      ),
    );
  }
}
