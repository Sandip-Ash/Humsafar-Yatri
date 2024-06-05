import 'package:flutter/material.dart';

import 'app_text_welcome.dart';
// import 'package:tourism_app/widgets/app_text_welcome.dart';
class AppButtons extends StatelessWidget {

  // here there are button designs for two buttons used over here //

  // 1. people group button
//2. favourite button

  final Color color;
  final Color backgroundcolor;
  double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool?isIcon;

   AppButtons({Key? key,
     this.isIcon=false,
     this.icon,
     this.text='Hi',
    required this.color,
    required this.size,
    required this.backgroundcolor,
    required this.borderColor,



  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: borderColor,

        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[350],
      ),

      // here apptext means the numbers //
      child: isIcon==false?Center(child: AppText(text: text!,color:color)):Center(child: Icon(icon,color: color,))

    );
  }
}
