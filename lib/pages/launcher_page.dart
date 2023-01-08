import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remit_ui/pages/signup_page.dart';

class LauncherPage extends StatelessWidget {
  static const String routeName = '/launcher';
  const LauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [

            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Send money anywhere in the world, faster and cheaper than your bank.',
                    style: TextStyle(fontSize: 24, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SvgPicture.asset('svg/launcher_icon.svg'),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et .',
                    style: TextStyle(fontSize: 15,color: Colors.grey),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SignupPage.routeName);
                },
                child: Text(
                  'Create a free account',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  fixedSize: Size.fromHeight(50),
                  side: BorderSide(
                    color: Colors.blue,
                    width: 1
                  )
                ),
                  onPressed: () {},
                  child: Text('View Exchange Rates',style: TextStyle(color: Colors.blue,fontSize: 16),)),
            ),
            SizedBox(height: 15,),
            Text(
              'Already have an account? Login',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16,color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
