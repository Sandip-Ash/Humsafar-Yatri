import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  AppText({Key? key,
    this.size=16,// default size
    required this.text,
    this.color=Colors.black54, // default color

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        // fontWeight: FontWeight.bold,
        color: color,
        fontSize: size,
      ),
    );
  }
}