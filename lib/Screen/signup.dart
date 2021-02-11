//Implimented concept of CarouselSlider the first pge of the app
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travlingapp/Common/String.dart';

import 'package:travlingapp/Common/colors.dart';
import 'package:travlingapp/Screen/loginscreen.dart';

import 'package:travlingapp/component/floatingactionbutton.dart';

class SignUpPage extends StatefulWidget {
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  CarouselSlider carouselSlider;
  int _current = 0;

  //mapping function
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    //exception handling
    try {
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
    } catch (e) {
      print(e);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    //Orientation for the screen
    double height1 = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    try {
      if (width > 600) {
        return View(height1=150);
      } else {
        return View(height1=500);

      }
    } catch (e) {}
  }
  //declaring widget
  Widget View(height) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        //setting width and height with mediaquery
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //  taking carouselSlider
            carouselSlider = CarouselSlider(
              height: MediaQuery.of(context).size.height*0.6,
              aspectRatio: 16 / 9,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: false,
              reverse: false,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              //calling the declared list
              items: Strings.imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: TravelAppColors.white,
                      ),
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(Strings.imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.grey : TravelAppColors.pink,
                  ),
                );
              }
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            //calling custtombutton call
            CustomButton(
              text: Strings.stratmessage,
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>  LoginScreen()));

                },
            )
          ],
        ),
      ),
    );

  }
}