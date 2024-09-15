import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Res/Routes/RouteNames.dart';
import 'package:untitled2/View/ForgotPasswordScreen.dart';
import 'package:untitled2/View/HomeScreen.dart';
import 'package:untitled2/View/LoginScreen.dart';
import 'package:untitled2/View/OnBoardingScreen.dart';
import 'package:untitled2/View/RegistrationScreen.dart';
import 'package:untitled2/View/SplashScreen.dart';

class Routes{
  static Route<dynamic> generateRoutes(RouteSettings settings){
    switch(settings.name){
      case RouteNames.splashscreen:
        return MaterialPageRoute(builder: (context)=>Splashscreen());

      case RouteNames.onboardingscreen:
        return MaterialPageRoute(builder: (context)=>OnBoarding_Screen());

      case RouteNames.loginscreen:
        return MaterialPageRoute(builder: (context)=>LoginScreen());

      case RouteNames.registrationscreen:
        return MaterialPageRoute(builder: (context)=>RegistrationScreen());

      case RouteNames.forgotpasswordscreen:
        return MaterialPageRoute(builder: (context)=>ForgotPasswordScreen());

      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context)=>HomeScreen());

      default :
        return MaterialPageRoute(builder: (context){
          return Scaffold(
            body: Container(child: Text("No Route Found"),),
          );
        });
        
    }
  }
}