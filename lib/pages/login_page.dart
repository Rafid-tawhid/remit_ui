import 'package:flutter/material.dart';
import 'package:remit_ui/pages/signup_page.dart';

import '../widgets/button1.dart';
import '../widgets/button_2.dart';
import 'enter_otp_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName='/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? country;
  bool showPass=true;
  List<String> listOfValue = ['1', '2', '3', '4', '5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title:  Text('Login to your Account',style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        color: Colors.white,
        child: Form(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 8.0,bottom: 8),
                child: DropdownButtonFormField(
                  value: country,
                  hint: Text(
                    'Select Country',
                    style: TextStyle(color: Colors.black),
                  ),
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      country = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      country = value;
                    });
                  },
                  validator: (value) {
                    if (value==null) {
                      return "can't empty";
                    } else {
                      return null;
                    }
                  },
                  items: listOfValue
                      .map((String val) {
                    return DropdownMenuItem(
                      value: val,
                      child: Text(
                        val,
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 8.0,bottom: 8),
                child: TextFormField(
                  keyboardType:  TextInputType.emailAddress,
                  decoration: InputDecoration(

                    hintText: "Email",

                    errorStyle: TextStyle(height: 0, color: Colors.transparent),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,

                    ),

                  ),
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3C3C43),
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 8.0,bottom: 8),
                child: TextFormField(
                  keyboardType:  TextInputType.visiblePassword,
                  obscureText: showPass,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: showPass?IconButton(onPressed: (){
                      setState(() {
                        showPass=!showPass;
                      });
                    }, icon: Icon(Icons.visibility)):IconButton(onPressed: (){
                      setState(() {
                        showPass=!showPass;
                      });
                    }, icon: Icon(Icons.visibility_off)),
                    errorStyle: TextStyle(height: 0, color: Colors.transparent),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3C3C43),
                  ),

                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Your Password should be at least 8 characters, and include 1 upper case letter, 1 lower case letter and number.',style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic),),//TEXT HERE
                      ),   //TEXT HERE
                    ),
                  ),
                  SizedBox(width: 30,)
                ],
              ),


              SizedBox(height: 45,),
              MainButton(title: 'Login',route: HomePage.routeName,),
              SizedBox(height: 15,),
              SecondaryButton(title: 'Continue with Phone Number',route: OtpPage.routeName,),
              SizedBox(height: 25,),
              Align(
                  alignment: Alignment.center,
                  child: InkWell(
                      child: Text('Don’t have an account? Sign up'),
                    onTap: (){
                        Navigator.pushNamed(context, SignupPage.routeName);
                    },
                  ))

            ],

          ),
        ),
      ),
    );
  }
}
