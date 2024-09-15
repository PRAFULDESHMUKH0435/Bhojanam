import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled2/Res/Routes/RouteNames.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacementNamed(context, RouteNames.onboardingscreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Images/splash.jpg'),fit:BoxFit.cover)
        ),
      ),
    );
  }
}
