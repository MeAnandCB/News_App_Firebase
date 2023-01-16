import 'package:flutter/material.dart';

class Favorate_selector extends StatefulWidget {
  const Favorate_selector({super.key});

  @override
  State<Favorate_selector> createState() => _Favorate_selectorState();
}

class _Favorate_selectorState extends State<Favorate_selector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.amber,
      ),
    );
  }
}
