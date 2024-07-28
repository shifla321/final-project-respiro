


import 'package:flutter/material.dart';
import 'package:respiro_projectfltr/Login/welcome.dart';
import 'package:respiro_projectfltr/home1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class first extends StatefulWidget {
  const first({super.key});
  check(BuildContext context)async{
    SharedPreferences preferences =await SharedPreferences.getInstance();
    String? name = preferences.getString('isLoggin');
    if (name !=null ){
       Navigator.push(context, MaterialPageRoute(builder: ((context) => const home1())));
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: ((context) => const first())));
    }
    
    
    
  }

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(image: AssetImage("images/res.jpg"),
          fit: BoxFit.cover
          ),
          
        ),
        
        ),
        
      );
      




    
  }
}
 