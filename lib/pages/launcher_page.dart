import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:remit_ui/pages/show_data.dart';
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
                  onPressed: () async {
                    var data;
                    try {
                      Response response = await post(
                          Uri.parse('https://au-0000.sandbox.auth.assemblypay.com/tokens'),
                          body: jsonEncode({
                            "grant_type": "client_credentials",
                            "client_id": "50i6b8idnbj18q86k9j2galpmf",
                            "client_secret": "5lfpl75j3dtko79523a7prapeh7up70v9qcqqg18719msvki6uh",
                            "scope": "im-au-03/b5e30ff0-1e6e-013a-2b9b-0a58a9feac03:00fd5dea-0800-4c84-acf0-5c1eeddca1af:3"
                          }));
                      if (response.statusCode == 200) {
                         var data =jsonDecode(response.body.toString());
                        print(data['access_token'].toString());
                        Response responses=await get(
                            Uri.parse('https://sandbox.au-0000.api.assemblypay.com/webhooks/'),
                            headers: {
                              'Content-Type': 'application/json',
                              'Accept': 'application/json',
                              'Authorization': '${data['access_token']}',
                            }
                        );
                        if(responses.statusCode==200){
                          var data2 =jsonDecode(responses.body.toString());
                          print(data2.toString());
                          Navigator.pushNamed(context, ShowDataPage.routeName,arguments: data2);
                        }
                        else{
                          print('Failed........ 2 ');
                        }
                      } else {
                        print('Failed........');
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  },
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
