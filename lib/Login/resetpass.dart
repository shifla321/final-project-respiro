import 'package:flutter/material.dart';
import 'package:respiro_projectfltr/Login/success.dart';

class resetpass extends StatefulWidget {
  const resetpass({super.key});

  @override
  State<resetpass> createState() => _resetpassState();
}

class _resetpassState extends State<resetpass> {
  final PhoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.red,

          image: DecorationImage(
            image: AssetImage(
              "assets/images/Wallpaper Sky.jpg"
              ),
              fit: BoxFit.cover,          
            
            )
        ),
        child: Form(
          key: _formKey ,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 160),
                child: Text("Reset Your Password",style: TextStyle(fontSize: 32,color: Colors.white),),
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
                hintText: "Enter Your Password",
                border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                ),
                prefixIcon:  Icon(Icons.lock_outline_rounded,size: 30,)
                
                
                
                )
                
                
                ),
              ),
              SizedBox(
                height: 15,
              ),
               Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: TextField(decoration: InputDecoration(fillColor: Colors.white.withOpacity(0.5),
                filled: true,
                hintText: " Conform Password",
                border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                ),
                suffixIcon:Icon(Icons.visibility_off,size: 30,)
                
                
                
                )
                
                
                ),
              ),
              SizedBox(
                height: 70,
              ),
              SizedBox(
                height: 35,
                width: 180,
                child: ElevatedButton(onPressed: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => success(),));
          
          
                }, child: Text("Done",style: TextStyle(fontSize:20 ),selectionColor: Colors.white.withOpacity(0.5))))
               
          
            ],
          ),
        ),
    ));
  }
}