import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travlingapp/Common/colors.dart';

class FlatBuuttonClass extends StatelessWidget {
  FlatBuuttonClass({@required this.onPressed,this.text});
  final GestureTapCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(text,style: TextStyle(
          color: TravelAppColors.pink,
              fontWeight: FontWeight.bold,
              fontSize:17
      ),
      ),
    );
  }
}