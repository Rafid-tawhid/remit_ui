import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  String title;
  String? route;


  MainButton({required this.title,this.route});

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromHeight(50),
        ),
        onPressed: (){
         widget.route==null?null:Navigator.pushNamed(context, widget.route!);
        },
        child: Text(
          widget.title,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
