import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:respiro_projectfltr/custom_round.dart';
import 'package:respiro_projectfltr/frame.dart';

class newspage1 extends StatefulWidget {
  const newspage1({super.key});

  @override
  State<newspage1> createState() => _newspage1State();
}

class _newspage1State extends State<newspage1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 195,
            child: Stack(children: [
              CustomPaint(
                size: const Size(double.maxFinite, 200),
                painter: RPSCustomPainter(),
              ),
              const CustomRound(),
              Padding(
                padding: const EdgeInsets.only(left: 80, top: 130,),
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),

                  color: HexColor("FCD594"),
                  
                  ),
                  child: Center(
                    child: Text(
                      
                      "News",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: HexColor("553504")),
                    ),
                  ),
                ),
              )
            ]),
          ),
          
          

        ],
        
      ),
      
    );
  }
}