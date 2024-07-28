import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:respiro_projectfltr/custom_round.dart';
import 'package:respiro_projectfltr/frame.dart';

class graph extends StatefulWidget {
  const graph({super.key});

  @override
  State<graph> createState() => _graphState();
}

class _graphState extends State<graph> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
 body: Column(
        children: [
          Stack(
                children: [
                 CustomPaint(
              size: const Size(double.maxFinite,200),
                painter: RPSCustomPainter() ,
            ),
            const CustomRound(),
            Padding(
              padding: const EdgeInsets.only(top: 90,left: 37),
              child: Container(
                height: 70,
                width: 290,
                child: Column(children: [
                  Center(child: Text("Graph",style: TextStyle(fontSize: 36,color: HexColor("553504"),fontWeight: FontWeight.bold),)),
                  
                 
                

                ],),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: HexColor("F4EAB6"),
                  

                ),
              
              ),
              
              
   
 )
                ]
          )
        ]
 )
 
    );
  }
}