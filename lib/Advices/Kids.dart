import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:respiro_projectfltr/frame.dart';

class kids_page extends StatefulWidget {
  const kids_page({super.key});

  @override
  State<kids_page> createState() => _kids_pageState();
}

class _kids_pageState extends State<kids_page> {
    List<String> sentences=['Implement sustainable practices:\n Rotate crops, use cover crops, and \n minimize tillage to improve soil health \n and reduce dust generation.\n',
       'Manage manure responsibly:\n Compost manure properly and utilize \n anaerobic digesters to capture methane \n emissions and generate renewable energy.\n',
       'Minimize pesticide and fertilizer use: \n Implement integrated pest management \n (IPM) and optimize fertilizer application \n based on soil testing to \n reduce chemical runoff and \n air pollution.',
       'Choose efficient irrigation methods:\n Utilize drip irrigation or precision \n irrigation to minimize water waste \n and nutrient leaching, reducing potential\n  water pollution.',
       "Support renewable energy:\n  Consider installing solar panels \n or wind turbines on your farm \n to reduce reliance on fossil fuels \n and decrease your carbon footprint.\n",];
       



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                
            CustomPaint(
              size: Size(double.maxFinite,200),
                painter: RPSCustomPainter(),
            ),
            
            Positioned(
              top: 15,
              left: 1,
               right: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 100,left: 25,right: 25),
                child: Container(  
                  height: 170,
                  width: 160,
                  decoration: BoxDecoration(
                    color: HexColor("FCD594"), 
                  ), 
                  child: Image.asset("assets/images/kids.png",fit: BoxFit.cover,),
            ),
          ),   
    ),
              ]
            )
          ),
          Text('Advice for kids in Polluted Areas:',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          Expanded(
            child: ListView.builder(itemBuilder:(context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Icon(Icons.fiber_manual_record,size: 10,),
                  ),
                  SizedBox(width: 8,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(sentences[index]),
                  ),
                ],
              );
            },
            itemCount: sentences.length,),
          )
         
        ]
      )
    );
  }
}