import 'package:flutter/material.dart';

class Bgimage extends StatelessWidget {
  const Bgimage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage(
            "images/Wallpaper Sky.jpg",
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      // height: double.infinity,
      width: double.infinity,);
  }
}