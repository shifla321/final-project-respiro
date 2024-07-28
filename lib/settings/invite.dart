import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Invite_page extends StatefulWidget {
  const Invite_page({super.key});

  @override
  State<Invite_page> createState() => _Invite_pageState();
}

class _Invite_pageState extends State<Invite_page> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
body: Stack(
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
            
            ),
             Center(
               child: Container(
                height: 680,
                width: 295,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.brown.withOpacity(0.5)
                 ),
                 child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Help Others To\nCheck Air Quality",style: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.normal),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30,left: 9),
                      child: Center(child: Text("Invite Frirnds to check the Air Quality  and breathe good Air",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.normal),),
                      ),
                    ),
                   Padding(
                     padding: const EdgeInsets.only(top: 30),
                     child: Container(
                                     height: 60,
                                     width: 200,
                                     
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(1),
                                       color: Colors.brown.withOpacity(0.5)
                                      ),
                      
                      ),
                   )
                  ],
                 ),
                           ),
             ),
          ],
),
);



    
  }
}