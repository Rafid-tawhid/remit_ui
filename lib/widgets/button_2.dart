import 'package:flutter/material.dart';

class SecondaryButton extends StatefulWidget {
  String title;
  String? route;
  SecondaryButton({required this.title, this.route});

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          onPressed: () {
            widget.route==null?null:Navigator.pushNamed(context, widget.route!);
          },
          child: Text(widget.title,style: TextStyle(color: Colors.blue,fontSize: 16),)),
    );
  }
}
