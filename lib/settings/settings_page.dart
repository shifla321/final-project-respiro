import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Settings_page extends StatefulWidget {
  const Settings_page({super.key});

  @override
  State<Settings_page> createState() => _Settings_pageState();
}

class _Settings_pageState extends State<Settings_page> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 15,),
          child: CircleAvatar(
            backgroundImage: AssetImage("images/profile.png"),
            radius: 50.0,
          ),
        ),
        SizedBox(height: 15,),
        Center(child: Text(" SHIFLA",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
      
      Padding(
        padding: EdgeInsets.only(top: 50),
       
        child: Text("Settings",style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal),),
      ),
      Divider(thickness: 1,color: Colors.black,),
      Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.language,size: 30,),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Language',style: TextStyle(fontSize: 20,),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 160),
            child: Icon(Icons.arrow_drop_down_circle_outlined,size: 30,),
          )
        ],
      ) ,
      Divider(thickness: 1,color: Color.fromARGB(255, 0, 0, 0),),
Row(
  children: [
    Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(Icons.light_mode_outlined,size: 30,),
    ),
    Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("Ligth Mode",style: TextStyle(fontSize: 20,),),
    )
  ],
),
Divider(thickness: 1,color: Color.fromARGB(255, 0, 0, 0),),

Row(
  children: [
    Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(Icons.person_pin,size: 30,),
    ),
    Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("Deactivate Account ",style: TextStyle(fontSize: 20,),),
    ),
    // elevatedbutton

  ],
),
Divider(thickness: 1,color: Color.fromARGB(255, 0, 0, 0),),

      ],),     
    );}}