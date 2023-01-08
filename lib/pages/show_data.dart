import 'package:flutter/material.dart';

class ShowDataPage extends StatefulWidget {
  const ShowDataPage({Key? key}) : super(key: key);
  static const String routeName='/show';

  @override
  State<ShowDataPage> createState() => _ShowDataPageState();
}

class _ShowDataPageState extends State<ShowDataPage> {
  var data;
  var text;
  @override
  void didChangeDependencies() {
   data=ModalRoute.of(context)!.settings.arguments as Object;
   if(data!=null){
     text=data;
   }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Show Json Data'),),
      body: Center(
        child: Wrap(
          children: [
            Text(data.toString())
          ],
        ),
      ),
    );
  }
}
