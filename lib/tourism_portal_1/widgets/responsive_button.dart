import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponse;
  double? width; // optional
  final String text;
  final VoidCallback? onPressed;

 ResponsiveButton({
  Key? key, this.width,
  this.isResponse=false,
  required this.text,
  this.onPressed,   // navigation between pages
 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,

      child: Container(
        width: width,
        height: 70,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,
        ) ,

        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white, // Customize text color as needed
              fontSize: 30, // Customize font size as needed
              fontWeight: FontWeight.bold, // Customize font weight as needed
            ),
          ),
        ),

      ),
    );
  }
}
