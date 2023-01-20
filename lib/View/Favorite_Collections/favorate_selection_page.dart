import 'package:flutter/material.dart';

class Favorite_Page extends StatelessWidget {
  const Favorite_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 250,
                child: Image.asset("assets/img/bg.png"),
              ),
            ),
            Text('No data Fond')
          ],
        ),
      ),
    );
  }
}
