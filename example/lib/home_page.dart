import 'package:example/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:short_navigation/short_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: navigation,
          child: const Text(
            "Go to Profile",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  void navigation() {
    // Go.to(ProfileScreen());

    // Go.toName("/home");

    // GoFade.to(ProfileScreen(), transitionDuration: Duration(milliseconds: 600));

    // GoSlide.to(ProfileScreen(), slideDirection: AxisDirection.left);

    // GoRotation.to(ProfileScreen());

    // GoScale.to(ProfileScreen(), alignment: Alignment.center);

    // GoSize.to(
    //   ProfileScreen(),
    //   sizeDirection: SizeDirection.center,
    //   sizeAxis: Axis.horizontal,
    //   transitionDuration: Duration(seconds: 1),
    // );

    GoAnimation.to(
      ProfileScreen(),
      transitions: [
        .fade(), //Or GoTransitions.fade() if you use last version of Dart
        .slide(),
      ],
      transitionDuration: Duration(seconds: 1),
    );
  }
}
