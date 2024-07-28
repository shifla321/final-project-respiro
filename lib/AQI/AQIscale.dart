import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:respiro_projectfltr/custom_container.dart';
import 'package:respiro_projectfltr/custom_round.dart';
import 'package:respiro_projectfltr/frame.dart';

class AQIscale extends StatelessWidget {
  const AQIscale({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: Column(
        children: [
          SizedBox(
              child: Stack(
                children: [
                 CustomPaint(
              size: const Size(double.maxFinite,200),
                painter: RPSCustomPainter(),
            ),
            const CustomRound(),
            Padding(
              padding: const EdgeInsets.only(left: 110,top: 90),
              child: Text("AQI Scale",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: HexColor("553504")),),
            )
      
                ]
              ),
          ),
          const Center(child: Text("Know about the category of air quality index(AQI) your ambient air falls and What is implies",
          style: TextStyle(fontSize: 16),
          

          ),
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            child: Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: HexColor("F4EAB6"),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 16),
                    child: Row(
                      children: [
                       Container(
                           height: 90,
                            width:150,
                         decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(12),
                          color: HexColor("F4BE6D"),
                          
                                                  
                        ),
                        child: Row(
                         children: [
                           Container(
                             height: 90,
                             width: 13,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(14),
                               color: Colors.green,
                               
                             ),
                             
                           ),
                           Image.asset("assets/images/good.png",scale: 10,),
                           Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text("Good",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
                                    ),
                                    Text("0-50",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                                  ],
                                ),
                         ],
                        ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Container(
                              height: 90,
                               width:150,
                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                             color: HexColor("F4BE6D"),
                             
                                                    
                           ),
                           child: Row(
                            children: [
                              Container(
                                height: 90,
                                width: 13,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.green,
                                ),
                                
                              ),
                              Image.asset("assets/images/modarate.png",scale: 10,),
                              Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text("Moderate",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
                                    ),
                                    Text("51-100",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                                  ],
                                ),
                          
                          
                                            ],
                                          )
                                          
                                        
                                      ),
                        )
                      ]
                    ),
                    
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16,top: 15),
                    child: Row(
                      children: [
                        Container(
                             height: 90,
                              width:150,
                           decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                            color: HexColor("F4BE6D"),
                            
                                                    
                          ),
                          child: Row(
                           children: [
                             Container(
                               height: 90,
                               width: 13,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(14),
                                 color: Colors.green,
                               ),
                               
                             ),
                             Image.asset("assets/images/poor.png",scale: 10,),
                             Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text("Poor",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
                                    ),
                                    Text("101-200",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                                  ],
                                ),
            
                           ],
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Container(
                                height: 90,
                                 width:150,
                              decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                               color: HexColor("F4BE6D"),
                               
                                                      
                             ),
                             child: Row(
                              children: [
                                Container(
                                  height: 90,
                                  width: 13,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.green,
                                  ),
                                  
                                ),
                                Image.asset("assets/images/unhealthy.png",scale: 10,),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text("UnHealthy",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
                                    ),
                                    Text("201-300",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                                  ],
                                ),
                            
                            
                                              ],
                                            )
                                            
                                          
                                        ),
                          ),
                          
                    
                      ],
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left: 16,top: 15),
                    child: Row(
                      children: [
                        Container(
                             height: 90,
                              width:150,
                           decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                            color: HexColor("F4BE6D"),
                            
                                                    
                          ),
                          child: Row(
                           children: [
                             Container(
                               height: 90,
                               width: 13,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(14),
                                 color: Colors.green,
                               ),
                               
                             ),
                             Image.asset("assets/images/severe.png",scale: 10,),
                             Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text("Severe",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
                                    ),
                                    Text("301-400",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                                  ],
                                ),
                           ],
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Container(
                                height: 90,
                                 width:150,
                              decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                               color: HexColor("F4BE6D"),
                               
                                                      
                             ),
                             child: Row(
                              children: [
                                Container(
                                  height: 90,
                                  width: 13,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.green,
                                  ),
                                  
                                ),
                                Image.asset("assets/images/hazardous.png",scale: 10,),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text("Dangerous",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
                                    ),
                                    Text("401-500",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                                  ],
                                ),
                            
                            
                                              ],
                                            )
                                            
                                          
                                        ),
                          ),
                          
                    
                      ],
                    ),
                  ),
                  
            
            
                    ]
                   ),
            ),
          ),
          SizedBox(
            height: 53,
          ),
          customcontainer()
          
        ],
        
        
       )

    );
  }
}