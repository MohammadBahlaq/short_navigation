// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:short_navigation/short_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Go.navigatorKey, //*Pass this navigatorKey here
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: ElevatedButton(
          onPressed: navigation,
          child: const Text("Go to Second Page"),
        ),
      ),
    );
  }

  void navigation() {
    // Go.to(SecondPage());

    // GoFade.to(SecondPage(), transitionDuration: Duration(milliseconds: 600));

    // GoSlide.to(SecondPage(), slideDirection: AxisDirection.left);

    // GoRotation.to(SecondPage());

    // GoScale.to(
    //   SecondPage(),
    //   alignment: Alignment.center,
    // );

    // GoSize.to(
    //   SecondPage(),
    //   sizeDirection: SizeDirection.center,
    //   sizeAxis: Axis.horizontal,
    // );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (Go.canBack() ?? false) {
              Go.back();
            }
          },
          child: const Text("Back to First Page"),
        ),
      ),
    );
  }
}
