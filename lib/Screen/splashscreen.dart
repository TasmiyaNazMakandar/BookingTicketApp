//splashscreen
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:travlingapp/Common/String.dart';
import 'package:travlingapp/Common/colors.dart';

import 'package:travlingapp/Screen/signup.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //setting time in seconds and path to next class
    Timer(
        Duration(seconds:3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>  SignUpPage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:TravelAppColors.blue,
      body: Container(
        //setting width and height with mediaquery
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splashlogo.png',width: 110,height: 110,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Strings.string1,style: TextStyle(
                  color: TravelAppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),),
                SizedBox(width: 10,),
                Text(Strings.string2,style: TextStyle(
                  color:TravelAppColors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}