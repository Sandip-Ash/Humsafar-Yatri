import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  AppLargeText({
    Key? key,
    this.size=30,
    required this.text,
    this.color=Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color,
        fontSize: size,
      ),
      softWrap: true,
      maxLines: 2, // Limits to 3 lines
      overflow: TextOverflow.ellipsis,
    );
  }
}
