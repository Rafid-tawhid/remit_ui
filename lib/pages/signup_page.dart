import 'package:flutter/material.dart';
import 'package:remit_ui/pages/home_page.dart';

import '../widgets/button1.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  static const String routeName = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? country;
  bool showPass = true;

  bool? clickCheck = false;
  List<String> listOfValue = ['1', '2', '3', '4', '5'];
  @override
  Widget build(BuildContext context) {
    //
    // final hight=MediaQuery.of(context).size.height;
    // final weight=MediaQuery.of(context).size.width;
    // print(hight);
    // print(weight);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'Create Account',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Form(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8.0, bottom: 8),
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
                    if (value == null) {
                      return "can't empty";
                    } else {
                      return null;
                    }
                  },
                  items: listOfValue.map((String val) {
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
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8.0, bottom: 8),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
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
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8.0, bottom: 8),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: showPass,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: showPass
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            },
                            icon: Icon(Icons.visibility))
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            },
                            icon: Icon(Icons.visibility_off)),
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
                        child: Text(
                          'Your Password should be at least 8 characters, and include 1 upper case letter, 1 lower case letter and number.',
                          style: TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.italic),
                        ), //TEXT HERE
                      ), //TEXT HERE
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8.0, bottom: 8),
                child: Text(
                  'Mobile',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 8.0, bottom: 8),
                    child: Text(
                      'By submitting this form, you accept daneshexchange’s Terms and Conditions and Privacy Policy',
                      style: TextStyle(
                          color: Colors.grey, fontStyle: FontStyle.italic),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                      value: clickCheck, //set variable for value
                      onChanged: (bool? value) {
                        print(value);
                        setState(() {
                          clickCheck = value;
                        });
                      }),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16,top: 12),
                        child: Text(
                          'If you DO NOT wish to receive marketing information about our products and special offers, please check this box.',
                          style: TextStyle(
                              color: Colors.grey, fontStyle: FontStyle.italic),
                        ),
                      )),
                  SizedBox(
                    height: 45,
                  ),
                ],
              ),

              SizedBox(
                height: 45,
              ),
              MainButton(
                title: 'Sign Up',
                route: HomePage.routeName,
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  child: Text('Already have an account? Login'),
                  onTap: () {
                    Navigator.pushNamed(context, LoginPage.routeName);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
