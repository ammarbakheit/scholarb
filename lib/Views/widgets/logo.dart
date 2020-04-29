import 'package:flutter/cupertino.dart';
import 'package:scholarb/utils/style.dart';

Widget logo() {
  return Container(
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SCHOLAR",
              style: TextStyle(
                  color: midgrayColor,
                  fontSize: 28,
                  fontWeight: w300,
                  fontFamily: montserrat),
            ),
            Text(
              "B",
              style: TextStyle(
                  color: mainColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  fontFamily: montserrat),
            ),
          ],
        ),
        // Text("Scholarships, Online courses", style: TextStyle(
        //   fontWeight: w500,
        //   color: midgrayColor,
        //   fontFamily: montserrat
        // ),)
      ],
    ),
  );
}
