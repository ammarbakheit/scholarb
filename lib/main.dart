import 'package:flutter/material.dart';
import 'package:scholarb/views/signin/singin.dart';
import 'package:scholarb/views/signup/signup.dart';
import 'package:scholarb/views/splashScreen/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScholarB',
      debugShowCheckedModeBanner: false,
      home: SplashSC(),
      routes: <String, WidgetBuilder>{
        "/signup": (BuildContext context) => SignUp(),
        "/singin": (BuildContext context) => Singin()
      },
    );
  }
}
