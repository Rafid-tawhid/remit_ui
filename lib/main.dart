import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:remit_ui/pages/calculator_page.dart';
import 'package:remit_ui/pages/enter_otp_page.dart';
import 'package:remit_ui/pages/home_page.dart';
import 'package:remit_ui/pages/launcher_page.dart';
import 'package:remit_ui/pages/show_data.dart';
import 'package:remit_ui/pages/signup_page.dart';
import 'package:remit_ui/providers/calculator_provider.dart';
import 'package:remit_ui/widgets/send.dart';
import 'package:remit_ui/widgets/send_money.dart';

import 'pages/login_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>CalculatorProvider())
    ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remit Danesh',
      builder: EasyLoading.init(),
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
        ShowDataPage.routeName:(context)=>ShowDataPage(),
        CalculatorPage.routeName:(context)=>CalculatorPage(),
      },
    );
  }
}

