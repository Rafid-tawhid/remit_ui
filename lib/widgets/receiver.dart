import 'package:flutter/material.dart';

class ReceiverWidget extends StatefulWidget {
  const ReceiverWidget({Key? key}) : super(key: key);

  @override
  State<ReceiverWidget> createState() => _ReceiverWidgetState();
}

class _ReceiverWidgetState extends State<ReceiverWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(

          children: [
            Icon(Icons.arrow_back,color: Colors.black,),
            SizedBox(width: 10,),
            Text('Back',style: TextStyle(color: Colors.black),)],
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                splashColor: Colors.redAccent,
                splashRadius: 100,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(

            leading: Image.network(
                'https://newwallpapershd.com/wp-content/uploads/2016/03/bangladesh-Flag.gif'),
            title: Text('Bangladesh'),
            subtitle: Text('Dhaka , Mirpur'),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add,color: Colors.blue,),
              SizedBox(width: 10,),
              Text('Add Recepint',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
            ],
          )
        ],
      ),
    );
  }
}
