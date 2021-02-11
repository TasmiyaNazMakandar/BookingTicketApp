import 'package:flutter/material.dart';
import 'package:travlingapp/Common/String.dart';
import 'package:travlingapp/Common/colors.dart';
import 'package:travlingapp/component/flatbutton.dart';
import 'package:travlingapp/component/floatingactionbutton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width*0.8,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Create',style: TextStyle(fontSize: 23),),
                Text('an account',style: TextStyle(fontSize: 23),)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(hintText:Strings.username,labelText: Strings.username),
                ),
                SizedBox(height:5),
                TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    decoration: InputDecoration(suffixIcon:Icon(Icons.email),hintText:Strings.useremail,labelText: Strings.useremail) ,
                    validator: (value) => value.isEmpty ? 'Email can\'t be empty':null,
                    onSaved: (value) => value.trim()),
                SizedBox(height:5),
                TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    decoration: InputDecoration(suffixIcon:Icon(Icons.remove_red_eye,color: TravelAppColors.pink,),hintText:Strings.userpassword,labelText: Strings.userpassword) ,
                    validator: (value) => value.isEmpty ? 'Passwprd can\'t be empty':null,
                    onSaved: (value) => value.trim()),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButton(
                        text: Strings.buttontext,
                        onPressed: (){},
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*20,
                  child: Row(
                    children: [Text(Strings.asking,style: TextStyle(
                      color: TravelAppColors.gray,
                      fontSize:15,
                      fontWeight: FontWeight.bold
                    ),),
                      FlatBuuttonClass(onPressed: (){},
                      text: Strings.buttontext1)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlatBuuttonClass(onPressed: (){},
                      text: Strings.buttontext2,
                   )
                  ],
                )

              ],

            ),
          ),
        ],
      ),



    );

  }
}
