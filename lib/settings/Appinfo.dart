import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:respiro_projectfltr/custom_round.dart';
import 'package:respiro_projectfltr/frame.dart';

class Appinfo extends StatelessWidget {
  const Appinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(


 
     body:  Column(
       children: [
         Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
          // color: Colors.red,
          image: DecorationImage(
            image: AssetImage(
         "images/res.jpg",
           ),
           fit: BoxFit.cover
          )
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 105),
            child: Center(child: Text("Version 1.0 \n     2024",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.brown),)),
          ),
          
          ),
       ],
     ),
    
   
 );
    
  }
} 