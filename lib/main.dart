import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:home/Component/StarterPageComponent/starter.dart';
import 'package:provider/provider.dart';
import 'Component/LoginPageComponent/LoginComponent.dart';
import 'Component/OnBoardingScreen/onboardingscreen.dart';
import 'Component/SignUpPageComponent/SignUpComponent.dart';
import 'Provider/MasterProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (BuildContext context) => MasterProvider(),
      ),
    ],
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  Starter(),
    );
  }
}

