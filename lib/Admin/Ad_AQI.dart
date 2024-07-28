import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ad_AQI extends StatefulWidget {
  const Ad_AQI({super.key});

  @override
  State<Ad_AQI> createState() => _Ad_AQIState();
}

class _Ad_AQIState extends State<Ad_AQI> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/res.jpg"),
            ),
          ),
          title: Row(
            children: [
                      Text('RESPIRO'    ,
                                  
                                      style: GoogleFonts.elsie(
                      color: const Color.fromARGB(255, 222, 170, 11)
                      )
                      ),
                      Text("                     AQI",style: TextStyle(color: Colors.black),)
                    ],
          ),
                  
                  ),
                  body: Column(
                    children: [Divider(color: Colors.black,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 70,top: 40),
                              child: Container(
                                height: 40,
                                width: 230,
                               
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                   color: Colors.grey.withOpacity(0.5),
                                ),
                                child: Center(child: Text("Top Polluted Cities List ")),
                              ),
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.only(left: 70,top: 9),
                              child: SingleChildScrollView(
                                child: Container(
                                  
                                    
                                    width: 250,
                                   
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                       color: Color.fromARGB(255, 211, 189, 20).withOpacity(0.5),
                                    ),
                                  
                                    //  child:   CircleAvatar(
                                      
                                      
                                    //   radius:10 ,
                                    //   backgroundImage: AssetImage(
                                        
                                    //     "assets/images/construction.png"),
                                    // ),
                                  child: Column(
                                    children: [
                                      ListView.separated(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                        return ExpansionTile(
                                        
                                        children: [
                                          Container(
                                            height: 200,
                                            color: Colors.red,
                                          )
                                        ],
                                        leading: CircleAvatar(backgroundImage: 
                                      AssetImage("assets/images/image.png"),),
                                      title: Text('India'),);
                                      }, separatorBuilder: (context, index) {
                                        return Divider(thickness: 5,color: Colors.white,);
                                      }, itemCount: 5)
                                      
                                    ],
                                  ),
                                    
                                
                                  ),
                                  
                              ),
                                 
                            )
                            
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                    height: 40,
                                    width: 230,
                                   
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                       color: Colors.grey.withOpacity(0.5),
                                    ),
                                    child: Center(child: Text("Historical graph ")),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    //graph
                                    child: Container( 
                                      height: 262,
                                      width: 250,
                                      color: Colors.amber,
                                    ),
                                  )
                          ],
                        ),
                      ],
                    )
                    ],
                  )
    );
  }
}
 