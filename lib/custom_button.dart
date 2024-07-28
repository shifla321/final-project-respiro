
import 'package:flutter/material.dart';


class Loginbutton extends StatelessWidget {
  
  final  void Function()? onPressed;
  final String text;
  const Loginbutton({ required this.onPressed,required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 200,
      child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      backgroundColor: MaterialStatePropertyAll(
                          Colors.white.withOpacity(0.5)), ),
                  onPressed: () {},
                  child:  Text( text,
                  
                  ),
                ),
    );
  }
}

// SizedBox(
//               width: 200,
//               height: 40,
//               child: 
//             ),