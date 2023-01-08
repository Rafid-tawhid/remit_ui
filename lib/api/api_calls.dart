import 'dart:convert';

import 'package:http/http.dart';

class ApiCallsToken {
   Future<void> getDetailsByBearToken()  async {
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
           //Navigator.pushNamed(context, ShowDataPage.routeName,arguments: data2);
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
   }
}


