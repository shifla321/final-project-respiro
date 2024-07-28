import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:respiro_projectfltr/Login/resetpass.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 168, 38, 29),
          image: DecorationImage(
              image: AssetImage("assets/images/Wallpaper Sky.jpg"),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    onSaved: (pin1) {},
                    decoration: InputDecoration(fillColor: Colors.white70,filled: true,
                    ),
                    style: Theme.of(context).textTheme.titleLarge,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    onSaved: (pin2) {},
                    decoration: InputDecoration(fillColor: Colors.white70,filled: true),
                    style: Theme.of(context).textTheme.titleLarge,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    onSaved: (pin3) {},
                    decoration: InputDecoration(fillColor: Colors.white70,filled: true),
                    style: Theme.of(context).textTheme.titleLarge,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    onSaved: (pin4) {},
                    decoration: InputDecoration(fillColor: Colors.white70,filled: true),
                    style: Theme.of(context).textTheme.titleLarge,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                
              ],
              
            ),
          ), SizedBox(
                    height: 36,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => resetpass(),));
                        },
                       
                          child: Text("Verify",
                              style: const TextStyle(fontSize: 20),
                              selectionColor: Colors.white.withOpacity(0.5)
                              ),
                        )
                            )
                            

        ],
      ),
      
      //  SizedBox(
      //               height: 36,
      //               width: 150,
      //               child: ElevatedButton(
      //                   onPressed: () {
                         
      //                   },
      //                   child: Text("Sign In",
      //                       style: const TextStyle(fontSize: 20),
      //                       selectionColor: Colors.white.withOpacity(0.5)
      //                       )
      //                       )
      //                       )
    ));
  }
}
