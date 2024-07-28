import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class customcontainer extends StatelessWidget {
  const customcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     Container(
          height: 38,
          width: double.infinity,
          
          decoration: BoxDecoration(
         color: HexColor("F4BE6D"),
         borderRadius: BorderRadius.circular(12)
          ),
         );
  }
}