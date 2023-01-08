import 'package:flutter/material.dart';
import 'package:remit_ui/pages/enter_otp_page.dart';
import 'package:remit_ui/pages/home_page.dart';
import 'package:remit_ui/pages/launcher_page.dart';
import 'package:remit_ui/pages/signup_page.dart';
import 'package:remit_ui/widgets/send.dart';

import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remit Danesh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName:(context)=>LauncherPage(),
        HomePage.routeName:(context)=>HomePage(),
        SignupPage.routeName:(context)=>SignupPage(),
        LoginPage.routeName:(context)=>LoginPage(),
        OtpPage.routeName:(context)=>OtpPage(),
        SendWidget.routeName:(context)=>SendWidget(),
      },
    );
  }
}

