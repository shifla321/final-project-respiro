import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:respiro_projectfltr/Login/otp.dart';
import 'package:respiro_projectfltr/Login/signin.dart';

class forgot extends StatefulWidget {
  const forgot({super.key});

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {
   final emailController= TextEditingController();
  final _formKey = GlobalKey<FormState>();


  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset email has been sent')),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No user found for that email')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.message}')),
        );
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

          image: DecorationImage 
          (image: AssetImage(
            "assets/images/Wallpaper Sky.jpg"
           ),
           fit: BoxFit.cover
          
          )
          ),
          child:  Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: Text("Forgot Password?",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white)),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40),
                  child: TextFormField(
                     validator: (value) {
                        if(value!.length<9){
                          return "Please Enter a Valid Phone Number";

                        }
                        return null;
                      },
                    decoration: InputDecoration(fillColor: Colors.white.withOpacity(0.5),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  hintText: "Email",
                  
                  ),),
                ),
                
            
                Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: SizedBox(
                    height:36,
                    width: 150,
                    child: ElevatedButton(onPressed: (){
                      if (_formKey.currentState!.validate()) {
                       resetPassword();
                      }
                     
                    }
                    , child: Text("SEND",style: TextStyle(fontSize: 20),selectionColor: Colors.black,)),
                  ),
                )
            
            
            
              ],
            ),
          )
          


        ),

      );
   
  }
}