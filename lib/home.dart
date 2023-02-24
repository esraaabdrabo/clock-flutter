import 'dart:async';
import 'package:flutter/material.dart';
import 'clock.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    updateClock();
  }

  updateClock() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          height: MediaQuery.of(context).size.height * .5,
          child: CustomPaint(
            painter: ClockPainter(),
          ),
        ),
      ),
    );
  }
}
