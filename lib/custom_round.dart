import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomRound extends StatelessWidget {
  const CustomRound({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
              alignment: Alignment.topRight,
              child: Container(height: 100,width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(200, 150)),color: HexColor("FCD594"),
              ),),);
  }
}