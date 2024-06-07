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
      body: ElevatedButton(
        onPressed: navigation,
        child: const Text("Go to Second Page"),
      ),
    );
  }

  navigation() {
    Go.to(SecondPage());
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () => Go.back(),
        child: const Text("Go to Second Page"),
      ),
    );
  }
}
