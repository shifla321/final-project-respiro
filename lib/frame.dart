import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  // Layer 1
  
  Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 244, 190, 109)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*-0.0134833,size.height*-0.0060143);
    path_0.lineTo(size.width*-0.0025000,size.height*0.6428571);
    path_0.quadraticBezierTo(size.width*0.2949167,size.height*0.9434571,size.width*0.5035500,size.height*0.9434000);
    path_0.quadraticBezierTo(size.width*0.7111500,size.height*0.9433714,size.width,size.height*0.6485714);
    path_0.lineTo(size.width*1.0081333,size.height*-0.0047714);
    path_0.lineTo(size.width*-0.0134833,size.height*-0.0060143);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);
  

  // Layer 1
  
  Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(0, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    
    canvas.drawPath(path_0, paint_stroke_0);
  

  // Layer 1
  
  Paint paint_fill_1 = Paint()
      ..color = const Color.fromARGB(255, 252, 213, 148)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_1 = Path();
    path_1.moveTo(size.width*-0.1166667,size.height*-0.2042857);
    path_1.lineTo(size.width*0.1833333,size.height*-0.0028571);
    path_1.quadraticBezierTo(size.width*0.2290000,size.height*0.3257143,size.width*-0.0206667,size.height*0.1160000);
    path_1.quadraticBezierTo(size.width*-0.0167083,size.height*0.0735000,size.width*0.0525000,size.height*-0.0105714);
    path_1.quadraticBezierTo(size.width*0.2317500,size.height*0.4452143,size.width*-0.0045000,size.height*0.5125714);
    path_1.quadraticBezierTo(size.width*-0.0322083,size.height*0.3407857,size.width*-0.1166667,size.height*-0.2042857);
    path_1.close();

    canvas.drawPath(path_1, paint_fill_1);
  

  // Layer 1
  
  Paint paint_stroke_1 = Paint()
      ..color = const Color.fromARGB(0, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    
    canvas.drawPath(path_1, paint_stroke_1);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
