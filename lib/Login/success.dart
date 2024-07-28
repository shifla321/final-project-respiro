import 'package:flutter/material.dart';
import 'package:respiro_projectfltr/home1.dart';

class success extends StatefulWidget {
  const success({super.key});

  @override
  State<success> createState() => _successState();
}

class _successState extends State<success> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage(
            "assets/images/Wallpaper Sky.jpg",
      ),
      fit: BoxFit.cover
        ),
        
        ),
        child: Column(
          children: [
            Container( color: Colors.red,

            ),
            SizedBox(
              height: 200,
            ),
            Image.asset("assets/images/screen.png",scale: 3),
            Text("Change Successfully",style: TextStyle(fontSize: 22,color: Color.fromRGBO(245, 240, 240, 1),fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 36,
              width: 156,
              child: ElevatedButton(onPressed: ( ){
                {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => home1(),));
                }
              }, child: const Text("Log In",style: TextStyle(fontSize: 20,color: Colors.black),
              )
              )
              )
          ],
        ),

    ),
    
    );
  }
}