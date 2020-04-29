import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scholarb/utils/style.dart';
import 'package:scholarb/views/widgets/logo.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashSC extends StatefulWidget {
  @override
  _SplashSCState createState() => _SplashSCState();
}

class _SplashSCState extends State<SplashSC> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed("/signup");
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            logo(),
            Text(
              "Scholarships, Online courses",
              style: TextStyle(
                  fontWeight: w500,
                  color: midgrayColor,
                  fontFamily: montserrat),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 25,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: LoadingIndicator(
                  indicatorType: Indicator.ballRotateChase, 
                  color: mainColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
