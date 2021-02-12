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
  bool _obscureText = true;
  //Written for password hide or show
  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  //To refer form widget
  var _formKey = GlobalKey<FormState>();
  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
  }

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
                Text(Strings.title1,style: TextStyle(fontSize: 23),),
                Text(Strings.title2,style: TextStyle(fontSize: 23),)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: _formKey,
              child: Column(
                children:<Widget> [
                  //declaring name filed and validating
                  TextFormField(
                    maxLines: 1,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  decoration: InputDecoration(hintText:Strings.username,labelText: Strings.username),
                    //For validation
                    validator: (value) {
                      if (value.isEmpty) {
                        return Strings.validationtxt;
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  //Declaring email field
                  TextFormField(
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: InputDecoration(suffixIcon:Icon(Icons.email),hintText:Strings.useremail,labelText: Strings.useremail),
                             onFieldSubmitted: (value) {
                                          },
                    //For validating email-id
                                   validator: (value) {
                                     Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                                     RegExp regex = new RegExp(pattern);
                                     try{
                                       if(value.isEmpty){
                                         return Strings.validationtxt;
                                       }else{  if(!regex.hasMatch(value))
                                         return Strings.emailmessage;
                                       }
                                     }catch(e){}

                                     },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                  ),
                  //password field
                  TextFormField(
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: InputDecoration(suffixIcon:IconButton(icon:Icon(_obscureText ? Icons.visibility:Icons.visibility_off,), onPressed: _togglePasswordStatus,color: TravelAppColors.pink,),hintText:Strings.userpassword,labelText: Strings.userpassword) ,
                 onFieldSubmitted: (value) {},
                  obscureText: _obscureText,
                    //validating password
                    validator: (value) {
                      Pattern pattern =  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                      RegExp regex = new RegExp(pattern);
                      try{
                        if(value.isEmpty){
                          return Strings.validationtxt;
                        }else{  if(!regex.hasMatch(value))
                          return Strings.passmessage;
                        }
                      }catch(e){}
                         },
                  )
                  ]
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            //calling customebutton class
            child: CustomButton(
              text: Strings.buttontext,
              onPressed: (){
                _submit();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 65, 0,0),
            width: MediaQuery.of(context).size.width*20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text(Strings.asking,style: TextStyle(
                    color: TravelAppColors.gray,
                    fontSize:18,
                    fontWeight: FontWeight.bold
                ),),
                FlatBuuttonClass(onPressed: (){},
                    text: Strings.buttontext1),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatBuuttonClass(onPressed: (){},
                  text: Strings.buttontext2,
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}

