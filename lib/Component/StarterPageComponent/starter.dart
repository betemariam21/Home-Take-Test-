import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:home/Component/HomePageComponent/homepagecomponent.dart';
import 'package:home/Component/LoginPageComponent/LoginComponent.dart';
import 'package:home/Component/OnBoardingScreen/onboardingscreen.dart';
import 'package:home/Services/FirebaseAuth.dart';

class Starter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: FirebaseAut().authStateChanges,
      builder: (context, snapshot){
        if(snapshot.hasData){
          return Homepage();
        }
        else {
          return OnBoardingScreen();
        }
      }
    );
  }
}
