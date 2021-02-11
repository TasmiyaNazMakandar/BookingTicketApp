//Common class for floatingactionbutton

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travlingapp/Common/colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({@required this.onPressed,this.text});
  final GestureTapCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(

      backgroundColor: TravelAppColors.pink,
        onPressed: onPressed,
      label: Text(text,style: TextStyle(
        fontSize: 20,

      ),
      ),
         );
  }
}