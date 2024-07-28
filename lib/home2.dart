import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:respiro_projectfltr/custom_container.dart';
import 'package:respiro_projectfltr/custom_round.dart';
import 'package:respiro_projectfltr/frame.dart';

class home2 extends StatefulWidget {
  const home2({super.key});

  @override
  State<home2> createState() => _home2State();
}

class _home2State extends State<home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              child: Stack(
                children: [
                 CustomPaint(
              size: Size(double.maxFinite,200),
                painter: RPSCustomPainter() ,
            ),
            CustomRound(),
            Padding(
              padding: const EdgeInsets.only(top: 110,left: 37),
              child: Container(
                height: 100,
                width: 290,
                child: Column(children: [
                  Text("Respiro",style: TextStyle(fontSize: 36,color: HexColor("553504"),fontWeight: FontWeight.bold),),
                  Text("Air Quality Checker",style: TextStyle(color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),fontSize: 22),)
                 
                

                ],),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: HexColor("F4EAB6"),
                  

                ),
              
              ),
              
              
            ),
          
                ],
              ),
              
              
              
          ),
          SizedBox(
            height: 20,

          ),
            Container(
              height: 400,
              width: double.infinity,
              
              color: HexColor("FCD594"),
              child: Stack(
                children: [
                  Column(
                    children: [
      Center(
       child: Padding(
     padding: const EdgeInsets.only(top:20),
    child: Container(
    height: 60,
     width:130,
  decoration: BoxDecoration(
borderRadius: BorderRadius.circular(12),
   color: HexColor("F4BE6D"),
   
                                              
 ),
 
 child: Stack(
  children: [
    Container(
      height: 60,
      width: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.green,
      ),
      
    )
  ],
 )

 ),
 
  ),
  
       ),
       SizedBox(
        height: 12,

       ),
       Container(
        height: 160,
        width: 330,
       
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
           color: const Color.fromARGB(255, 255, 255, 255),
           boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),blurRadius: 05,offset: Offset(0.5, 0.5)
            )
           ]
        ),
       ),
       SizedBox(
        height: 12,

       ),
       Container(
        height: 80,
        width: 333,
       
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
           color: const Color.fromARGB(255, 255, 255, 255),
           boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),blurRadius: 05,offset: Offset(0.5, 0.5)
            )
           ]
        ),
       )
                    
               
                    ],
                    
                  )
                ],
                
                
                 
              ),
            ),
            SizedBox(
              height: 72,
            )
          ,
            
            customcontainer()

          
        ],
        
      ),
      

    );
  }
}