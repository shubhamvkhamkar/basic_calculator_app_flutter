import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  //declaring variables
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;

  MyButton({this.color,this.textColor,
    required this.buttonText,this.buttontapped});
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap: buttontapped,
     child: Padding(
       padding: const EdgeInsets.all(0.5) ,
       child: ClipRRect(
         borderRadius: BorderRadius.all(Radius.circular(20)),
         child: Container(
           color: color,
           child: Center(
             child: Text(
               buttonText,style: TextStyle(
               color: textColor,fontSize: 25,
                 fontWeight: FontWeight.bold
             ),
             ),
           ) ,
         ),
       ),
     ),
   );
  }

}