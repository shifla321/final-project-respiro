import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:respiro_projectfltr/Login/signin.dart';
import 'package:respiro_projectfltr/Login/signup_ph.dart';
import 'package:respiro_projectfltr/home1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String email = " ", password = "";
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool _obscureText = true;
  login()async
{
  SharedPreferences preferances= await SharedPreferences.getInstance();
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
 );
 preferances.setString('isLoggin', credential.user!.uid);
 ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Sign in succesfull')));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const home1(),
            ));
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('The user is not found'),
          ));
  } else if (e.code == 'wrong-password') {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Wrong password'),
          ));
  }
}
}


 
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
        )
        ),
        child: Column(children: [
          SizedBox(
            height: 550,
            
          ),
          ElevatedButton(
            style:ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white.withOpacity(0.4)),

              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10),
                
              ),
              
              ),minimumSize: MaterialStateProperty.all(Size(280, 50)
              )
            ),
            
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> signin())
              );
            }, child: Text("Sign In",style:TextStyle(fontSize: 24,color: Colors.black),)),
          SizedBox(
height: 30,

          ),
          ElevatedButton(
            style:ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white.withOpacity(0.5)),

              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10),
                
              ),
              
              ),minimumSize: MaterialStateProperty.all(Size(280, 50)
              )
            ),
            
            onPressed: (){
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> signup_ph())
              );
            }, child: Text("Sign Up",style:TextStyle(fontSize: 24,color: Colors.black)))
             //, child: Text("Sign Up",style:TextStyle(fontSize: 24,color: Colors.black))),
          
        ],),
      )

      

    );
  }
}